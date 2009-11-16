" Vim script
" File: colorsel.vim
" Summary: A simple interactive RGB/HSV color selector.
" Author: David Necas (Yeti) <yeti@physics.muni.cz>
" License: This Vim script is in the public domain.
" Version: 2009-05-05
" Usage: After sourcing, do :ColorSel (it accepts an optional rrggbb or color
"        name argument).
" Keys:
"   j, k  switch between channels (also: <up>, <down>)
"   0, $  sets value to zero, maximum (also: <home>, <end>)
"   h, l  increment/decrement by 1 (also: <left>, <right>)
"   w, b  increment/decrement by larger amount (also: <pageup>, <pagedown>)
"   q     quits immediately
"   y     yanks color in #rrggbb form to the unnamed register
"   "xy   yanks color in #rrggbb form to register x and shows the color in
"         palette entry x
"   "xp   pastes the color from palette entry x into the color selector
"   "xP   pastes the color from palette entry x into the alternate color
"         selector
"    x    swaps color and alternate color
" Parameters:
"   colorsel_swatch_size [number]: vertical swatch size, do not set below 8
"   colorsel_slider_size [number]: slider size, longer sliders a need faster
"                                  computer
"   colorsel_show_palette [0/1]:   flag whether to show palette
"   colorsel_show_swatch_difference [0/1]:  flag whether to split the swatch
"                                           into two parts; the alternate color
"                                           is set to the color passed to
"                                           :ColorSel and can also be set from
"                                           the palette to compare two colors
"                                           side-by-side
" Bugs: Must reload script to change parameters
" TODO: Mouse support

if v:version < 602
  finish
endif
if !has('gui_running')
  "echoerr 'Color selector needs GUI'
  finish
endif

let s:swatchSize = exists('colorsel_swatch_size') ? colorsel_swatch_size : 8
let s:swatchSize = s:swatchSize < 8 ? 8 : s:swatchSize
let s:sliderSize = exists('colorsel_slider_size') ? colorsel_slider_size : 16
let s:q = 255*s:sliderSize/(s:sliderSize - 1)
let s:q6 = 359*s:sliderSize/(s:sliderSize - 1)
let s:showPalette = exists('colorsel_show_palette') ? colorsel_show_palette : 1
let s:showSwatchDifference = exists('colorsel_show_swatch_difference') ? colorsel_show_swatch_difference : 1
let s:bufname = '==[ Color Selector ]=='
let s:dashes = '----------'
let s:dashes = s:dashes . s:dashes
let s:dashes = s:dashes . s:dashes
let s:dashes = s:dashes . s:dashes
let s:active = 'r'
let s:guifg = 'white'

function! s:size2width(h)
  return 8*a:h/5
endfun

function! s:swatchBottom()
  if s:showSwatchDifference && s:altColor != ''
    return ' -- ' . s:altColor . ' ' . strpart(s:dashes, 0, s:size2width(s:swatchSize) - 10)
  else
    return ' ' . strpart(s:dashes, 0, s:size2width(s:swatchSize) - 7) . ' Yeti -'
  endif
endfun

function! s:drawSwatch()
  let i = 0
  let frameTop = strpart(s:dashes, 0, s:size2width(s:swatchSize))
  let s:space = ''
  while i < s:size2width(s:swatchSize)
    let s:space = s:space . ' '
    let i = i+1
  endwhile

  call append(0, s:swatchBottom())

  let s:space = '|' . s:space . '|'
  let i = 0
  while i < s:swatchSize
    call append(0, s:space)
    let i = i+1
  endwhile
  call append(0, ' ' . frameTop)
endfun

function! s:sliderStr(val, max)
  let slider = ''
  let pos = a:val*s:sliderSize/(a:max + 1)
  let i = 0
  while i < s:sliderSize
    let slider = slider . (i == pos ? '#' : ' ')
    let i = i+1
  endwhile
  return "[" . slider .  "]"
endfun

function! s:byte2dec(byte)
  let s = '' . a:byte
  if a:byte < 100
    let s = ' ' . s
  endif
  if a:byte < 10
    let s = ' ' . s
  endif
  return s
endfun

function! s:formatLine(val, l, max)
  let dec = s:byte2dec(a:val)
  let slider = a:l . ' ' . s:sliderStr(a:val, a:max)
  if s:active == tolower(a:l)
    let active_l = '->'
    let active_r = '<-'
  else
    let active_l = '  '
    let active_r = '  '
  endif
  return '  ' . active_l . slider . active_r . '  ' . dec
endfun

function! s:palette(register, revert)
  if !s:showPalette
    return ''
  endif

  let rgb = s:translateColor(getreg(a:register))
  if rgb != ''
    exec 'hi colorselPalette' . a:register . ' guibg=#' . rgb
  endif
  let swatch = '     '
  let entry = a:register . ':' .  strpart('      ', 0, 6 - strlen(rgb)) . rgb
  return (a:revert ? swatch . entry : entry . swatch)
endfun

function! s:drawStatus()
  call setline(2, s:space . s:formatLine(s:red, 'R', 255)        . '    ' . s:palette('a',0) . s:palette('g',1))
  call setline(3, s:space . s:formatLine(s:green, 'G', 255)      . '    ' . s:palette('b',0) . s:palette('h',1))
  call setline(4, s:space . s:formatLine(s:blue, 'B', 255)       . '    ' . s:palette('c',0) . s:palette('i',1))
  call setline(5, s:space . s:formatLine(s:hue, 'H', 359)        . '    ' . s:palette('d',0) . s:palette('j',1))
  call setline(6, s:space . s:formatLine(s:saturation, 'S', 255) . '    ' . s:palette('e',0) . s:palette('k',1))
  call setline(7, s:space . s:formatLine(s:value, 'V', 255)      . '    ' . s:palette('f',0) . s:palette('l',1))
  setlocal nomodified
endfun

function! s:byte2hex(byte)
  let hexdigits = '0123456789abcdef'
  let low = a:byte % 16
  let hi = a:byte / 16
  return hexdigits[hi] . hexdigits[low]
endfun

function! s:rgb2color(r, g, b)
  return s:byte2hex(a:r) . s:byte2hex(a:g) . s:byte2hex(a:b)
endfun

function! s:currentcolor()
  return s:rgb2color(s:red, s:green, s:blue)
endfun

function! s:update()
  let c = s:currentcolor()
  exec 'hi colorselColor guibg=#' . c
  if 3*s:green + 2*s:red + s:blue > 3*255
    let s:guifg = 'black'
  else
    let s:guifg = 'white'
  endif
  call s:hiRGB()
  call s:hiHue()
  call s:hiSaturation()
  call s:hiValue()
  let frame = ' -- ' . c . ' ' . strpart(s:dashes, 0, s:size2width(s:swatchSize) - 10)
  call setline(1, frame)
  call s:drawStatus()
endfun

function! s:updateHSV()
  let max = s:red > s:green ? s:red : s:green
  let max = max > s:blue ? max : s:blue
  let min = s:red < s:green ? s:red : s:green
  let min = min < s:blue ? min : s:blue
  let s:value = max
  let d = max - min
  if d > 0
    let s:saturation = 255*d/max
    if s:red == max
      let s:hue = 60*(s:green - s:blue)/d
    elseif s:green == max
      let s:hue = 120 + 60*(s:blue - s:red)/d
    else
      let s:hue = 240 + 60*(s:red - s:green)/d
    endif
    let s:hue = (s:hue + 360) % 360
  else
    let s:saturation = 0
    let s:hue = 0
  endif
endfun

function! s:updateRGB()
  let s:red = s:hsv2r(s:hue, s:saturation, s:value)
  let s:green = s:hsv2g(s:hue, s:saturation, s:value)
  let s:blue = s:hsv2b(s:hue, s:saturation, s:value)
endfun

function! s:updateAlt()
  if !s:showSwatchDifference || s:altColor == ''
    return
  endif
  if !exists('b:didDefineAltSwatchOverlay')
    exec 'syn match colorselAlternateColor "^\%>'.(s:swatchSize / 2 + 1).'l| \+|"ms=s+1,me=e-1'
    let b:didDefineAltSwatchOverlay = 1
  endif
  exec 'hi colorselAlternateColor guibg=#' . s:altColor
  call setline(s:swatchSize + 2, s:swatchBottom())
endfun

function! s:hsv2r(h, s, v)
  if a:s == 0
    return a:v
  endif
  let f = a:h % 60
  let i = a:h/60
  if i == 0 || i == 5
    return a:v
  elseif i == 2 || i == 3
    return a:v*(255 - a:s)/255
  elseif i == 1
    return a:v*(255*60 - (a:s*f))/60/255
  else
    return a:v*(255*60 - a:s*(60 - f))/60/255
  endif
endfun

function! s:hsv2g(h, s, v)
  if a:s == 0
    return a:v
  endif
  let f = a:h % 60
  let i = a:h/60
  if i == 1 || i == 2
    return a:v
  elseif i == 4 || i == 5
    return a:v*(255 - a:s)/255
  elseif i == 3
    return a:v*(255*60 - (a:s*f))/60/255
  else
    return a:v*(255*60 - a:s*(60 - f))/60/255
  endif
endfun

function! s:hsv2b(h, s, v)
  if a:s == 0
    return a:v
  endif
  let f = a:h % 60
  let i = a:h/60
  if i == 3 || i == 4
    return a:v
  elseif i == 0 || i == 1
    return a:v*(255 - a:s)/255
  elseif i == 5
    return a:v*(255*60 - (a:s*f))/60/255
  else
    return a:v*(255*60 - a:s*(60 - f))/60/255
  endif
endfun

function! s:paste()
  if !s:setColor(getreg(v:register))
    echohl WarningMsg
    let v:warningmsg = "Register " . v:register . " doesn't contain a valid color."
    echomsg v:warningmsg
    echohl None
    return
  else
    echomsg 'Pasted color #' . s:currentcolor()
  endif
  call s:update()
endfun

function! s:pasteAlt()
  let color = s:translateColor(getreg(v:register))
  if color == ''
    echohl WarningMsg
    let v:warningmsg = "Register " . v:register . " doesn't contain a valid color."
    echomsg v:warningmsg
    echohl None
    return
  else
    let s:altColor = color
    call s:updateAlt()
    echomsg 'Pasted alternate color #' . color
  endif
  call s:update()
endfun

function! s:yank()
  call setreg(v:register, '#' . s:currentcolor(), 'c')
  call s:drawStatus()
  echomsg 'Yanked color #' . s:currentcolor()
endfun

function! s:swap()
  let currentColor = s:currentcolor()
  if exists('b:didDefineAltSwatchOverlay') && b:didDefineAltSwatchOverlay
    call s:setColor(s:altColor)
  endif
  let s:altColor = currentColor
  call s:update()
  call s:updateAlt()
  echo 'Swapped colors'
endfun

function! s:inc()
  if s:active == 'r'
    let s:red = (s:red >= 255) ? 255 : s:red+1
    call s:updateHSV()
  elseif s:active == 'g'
    let s:green = (s:green >= 255) ? 255 : s:green+1
    call s:updateHSV()
  elseif s:active == 'b'
    let s:blue = (s:blue >= 255) ? 255 : s:blue+1
    call s:updateHSV()
  elseif s:active == 'h'
    let s:hue = (s:hue >= 359) ? 359 : s:hue+1
    call s:updateRGB()
  elseif s:active == 's'
    let s:saturation = (s:saturation >= 255) ? 255 : s:saturation+1
    call s:updateRGB()
  elseif s:active == 'v'
    let s:value = (s:value >= 255) ? 255 : s:value+1
    call s:updateRGB()
  endif
  call s:update()
endfun

function! s:dec()
  if s:active == 'r'
    let s:red = (s:red <= 0) ? 0 : s:red-1
    call s:updateHSV()
  elseif s:active == 'g'
    let s:green = (s:green <= 0) ? 0 : s:green-1
    call s:updateHSV()
  elseif s:active == 'b'
    let s:blue = (s:blue <= 0) ? 0 : s:blue-1
    call s:updateHSV()
  elseif s:active == 'h'
    let s:hue = (s:hue <= 0) ? 0 : s:hue-1
    call s:updateRGB()
  elseif s:active == 's'
    let s:saturation = (s:saturation <= 0) ? 0 : s:saturation-1
    call s:updateRGB()
  elseif s:active == 'v'
    let s:value = (s:value <= 0) ? 0 : s:value-1
    call s:updateRGB()
  endif
  call s:update()
endfun

function! s:end()
  if s:active == 'r'
    let s:red = 255
    call s:updateHSV()
  elseif s:active == 'g'
    let s:green = 255
    call s:updateHSV()
  elseif s:active == 'b'
    let s:blue = 255
    call s:updateHSV()
  elseif s:active == 'h'
    let s:hue = 359
    call s:updateRGB()
  elseif s:active == 's'
    let s:saturation = 255
    call s:updateRGB()
  elseif s:active == 'v'
    let s:value = 255
    call s:updateRGB()
  endif
  call s:update()
endfun

function! s:begin()
  if s:active == 'r'
    let s:red = 0
    call s:updateHSV()
  elseif s:active == 'g'
    let s:green = 0
    call s:updateHSV()
  elseif s:active == 'b'
    let s:blue = 0
    call s:updateHSV()
  elseif s:active == 'h'
    let s:hue = 0
    call s:updateRGB()
  elseif s:active == 's'
    let s:saturation = 0
    call s:updateRGB()
  elseif s:active == 'v'
    let s:value = 0
    call s:updateRGB()
  endif
  call s:update()
endfun

function! s:pginc()
  if s:active == 'r'
    let s:red = (s:red >= 240) ? 255 : s:red+16
    call s:updateHSV()
  elseif s:active == 'g'
    let s:green = (s:green >= 240) ? 255 : s:green+16
    call s:updateHSV()
  elseif s:active == 'b'
    let s:blue = (s:blue >= 240) ? 255 : s:blue+16
    call s:updateHSV()
  elseif s:active == 'h'
    let s:hue = (s:hue >= 340) ? 359 : s:hue+20
    call s:updateRGB()
  elseif s:active == 's'
    let s:saturation = (s:saturation >= 240) ? 255 : s:saturation+16
    call s:updateRGB()
  elseif s:active == 'v'
    let s:value = (s:value >= 240) ? 255 : s:value+16
    call s:updateRGB()
  endif
  call s:update()
endfun

function! s:pgdec()
  if s:active == 'r'
    let s:red = (s:red <= 16) ? 0 : s:red-16
    call s:updateHSV()
  elseif s:active == 'g'
    let s:green = (s:green <= 16) ? 0 : s:green-16
    call s:updateHSV()
  elseif s:active == 'b'
    let s:blue = (s:blue <= 16) ? 0 : s:blue-16
    call s:updateHSV()
  elseif s:active == 'h'
    let s:hue = (s:hue <= 20) ? 0 : s:hue-20
    call s:updateRGB()
  elseif s:active == 's'
    let s:saturation = (s:saturation <= 16) ? 0 : s:saturation-16
    call s:updateRGB()
  elseif s:active == 'v'
    let s:value = (s:value <= 16) ? 0 : s:value-16
    call s:updateRGB()
  endif
  call s:update()
endfun

function! s:hiRGB()
  let i = 0
  while i < s:sliderSize
    let byte = s:q*i/s:sliderSize
    let c = s:rgb2color(byte, s:green, s:blue)
    exec 'hi colorselRed' . i . ' guibg=#' . c . ' guifg=' . s:guifg
    let c = s:rgb2color(s:red, byte, s:blue)
    exec 'hi colorselGreen' . i . ' guibg=#' . c . ' guifg=' . s:guifg
    let c = s:rgb2color(s:red, s:green, byte)
    exec 'hi colorselBlue' . i . ' guibg=#' . c . ' guifg=' . s:guifg
    let i = i+1
  endwhile
endfun

function! s:hiHue()
  let i = 0
  while i < s:sliderSize
    let byte = s:q6*i/s:sliderSize
    let r = s:hsv2r(byte, s:saturation, s:value)
    let g = s:hsv2g(byte, s:saturation, s:value)
    let b = s:hsv2b(byte, s:saturation, s:value)
    let c = s:rgb2color(r, g, b)
    exec 'hi colorselHue' . i . ' guibg=#' . c . ' guifg=' . s:guifg
    let i = i+1
  endwhile
endfun

function! s:hiSaturation()
  let i = 0
  while i < s:sliderSize
    let byte = s:q*i/s:sliderSize
    let r = s:hsv2r(s:hue, byte, s:value)
    let g = s:hsv2g(s:hue, byte, s:value)
    let b = s:hsv2b(s:hue, byte, s:value)
    let c = s:rgb2color(r, g, b)
    exec 'hi colorselSaturation' . i . ' guibg=#' . c . ' guifg=' . s:guifg
    let i = i+1
  endwhile
endfun

function! s:hiValue()
  let i = 0
  while i < s:sliderSize
    let byte = s:q*i/s:sliderSize
    let r = s:hsv2r(s:hue, s:saturation, byte)
    let g = s:hsv2g(s:hue, s:saturation, byte)
    let b = s:hsv2b(s:hue, s:saturation, byte)
    let c = s:rgb2color(r, g, b)
    exec 'hi colorselValue' . i . ' guibg=#' . c . ' guifg=' . s:guifg
    let i = i+1
  endwhile
endfun

function! s:active2line(a)
  return stridx('rgbhsv', tolower(a:a))
endfun

function! s:activeUp()
  let s:active = 'rgbhsv'[(stridx('rgbhsv', s:active) + 5) % 6]
  call s:drawStatus()
endfun

function! s:activeDown()
  let s:active = 'rgbhsv'[(stridx('rgbhsv', s:active) + 1) % 6]
  call s:drawStatus()
endfun

function! s:translateColor(string)
  " remove # prefix and any leading and trailing whitespace
  let color = matchstr(a:string, '^\s*#\?\zs\S\+')

  " check if value is hexadecimal
  if color !~? '^\x\+$'
    " CSS color names (http://www.w3schools.com/css/css_colornames.asp)

    if     color ==? 'AliceBlue'            | let color = 'f0f8ff'
    elseif color ==? 'AntiqueWhite'         | let color = 'faebd7'
    elseif color ==? 'Aqua'                 | let color = '00ffff'
    elseif color ==? 'Aquamarine'           | let color = '7fffd4'
    elseif color ==? 'Azure'                | let color = 'f0ffff'
    elseif color ==? 'Beige'                | let color = 'f5f5dc'
    elseif color ==? 'Bisque'               | let color = 'ffe4c4'
    elseif color ==? 'Black'                | let color = '000000'
    elseif color ==? 'BlanchedAlmond'       | let color = 'ffebcd'
    elseif color ==? 'Blue'                 | let color = '0000ff'
    elseif color ==? 'BlueViolet'           | let color = '8a2be2'
    elseif color ==? 'Brown'                | let color = 'a52a2a'
    elseif color ==? 'BurlyWood'            | let color = 'deb887'
    elseif color ==? 'CadetBlue'            | let color = '5f9ea0'
    elseif color ==? 'Chartreuse'           | let color = '7fff00'
    elseif color ==? 'Chocolate'            | let color = 'd2691e'
    elseif color ==? 'Coral'                | let color = 'ff7f50'
    elseif color ==? 'CornflowerBlue'       | let color = '6495ed'
    elseif color ==? 'Cornsilk'             | let color = 'fff8dc'
    elseif color ==? 'Crimson'              | let color = 'dc143c'
    elseif color ==? 'Cyan'                 | let color = '00ffff'
    elseif color ==? 'DarkBlue'             | let color = '00008b'
    elseif color ==? 'DarkCyan'             | let color = '008b8b'
    elseif color ==? 'DarkGoldenRod'        | let color = 'b8860b'
    elseif color ==? 'DarkGray'             | let color = 'a9a9a9'
    elseif color ==? 'DarkGreen'            | let color = '006400'
    elseif color ==? 'DarkKhaki'            | let color = 'bdb76b'
    elseif color ==? 'DarkMagenta'          | let color = '8b008b'
    elseif color ==? 'DarkOliveGreen'       | let color = '556b2f'
    elseif color ==? 'Darkorange'           | let color = 'ff8c00'
    elseif color ==? 'DarkOrchid'           | let color = '9932cc'
    elseif color ==? 'DarkRed'              | let color = '8b0000'
    elseif color ==? 'DarkSalmon'           | let color = 'e9967a'
    elseif color ==? 'DarkSeaGreen'         | let color = '8fbc8f'
    elseif color ==? 'DarkSlateBlue'        | let color = '483d8b'
    elseif color ==? 'DarkSlateGray'        | let color = '2f4f4f'
    elseif color ==? 'DarkTurquoise'        | let color = '00ced1'
    elseif color ==? 'DarkViolet'           | let color = '9400d3'
    elseif color ==? 'DeepPink'             | let color = 'ff1493'
    elseif color ==? 'DeepSkyBlue'          | let color = '00bfff'
    elseif color ==? 'DimGray'              | let color = '696969'
    elseif color ==? 'DodgerBlue'           | let color = '1e90ff'
    elseif color ==? 'FireBrick'            | let color = 'b22222'
    elseif color ==? 'FloralWhite'          | let color = 'fffaf0'
    elseif color ==? 'ForestGreen'          | let color = '228b22'
    elseif color ==? 'Fuchsia'              | let color = 'ff00ff'
    elseif color ==? 'Gainsboro'            | let color = 'dcdcdc'
    elseif color ==? 'GhostWhite'           | let color = 'f8f8ff'
    elseif color ==? 'Gold'                 | let color = 'ffd700'
    elseif color ==? 'GoldenRod'            | let color = 'daa520'
    elseif color ==? 'Gray'                 | let color = '808080'
    elseif color ==? 'Green'                | let color = '008000'
    elseif color ==? 'GreenYellow'          | let color = 'adff2f'
    elseif color ==? 'HoneyDew'             | let color = 'f0fff0'
    elseif color ==? 'HotPink'              | let color = 'ff69b4'
    elseif color ==? 'IndianRed'            | let color = 'cd5c5c'
    elseif color ==? 'Indigo'               | let color = '4b0082'
    elseif color ==? 'Ivory'                | let color = 'fffff0'
    elseif color ==? 'Khaki'                | let color = 'f0e68c'
    elseif color ==? 'Lavender'             | let color = 'e6e6fa'
    elseif color ==? 'LavenderBlush'        | let color = 'fff0f5'
    elseif color ==? 'LawnGreen'            | let color = '7cfc00'
    elseif color ==? 'LemonChiffon'         | let color = 'fffacd'
    elseif color ==? 'LightBlue'            | let color = 'add8e6'
    elseif color ==? 'LightCoral'           | let color = 'f08080'
    elseif color ==? 'LightCyan'            | let color = 'e0ffff'
    elseif color ==? 'LightGoldenRodYellow' | let color = 'fafad2'
    elseif color ==? 'LightGrey'            | let color = 'd3d3d3'
    elseif color ==? 'LightGreen'           | let color = '90ee90'
    elseif color ==? 'LightPink'            | let color = 'ffb6c1'
    elseif color ==? 'LightSalmon'          | let color = 'ffa07a'
    elseif color ==? 'LightSeaGreen'        | let color = '20b2aa'
    elseif color ==? 'LightSkyBlue'         | let color = '87cefa'
    elseif color ==? 'LightSlateGray'       | let color = '778899'
    elseif color ==? 'LightSteelBlue'       | let color = 'b0c4de'
    elseif color ==? 'LightYellow'          | let color = 'ffffe0'
    elseif color ==? 'Lime'                 | let color = '00ff00'
    elseif color ==? 'LimeGreen'            | let color = '32cd32'
    elseif color ==? 'Linen'                | let color = 'faf0e6'
    elseif color ==? 'Magenta'              | let color = 'ff00ff'
    elseif color ==? 'Maroon'               | let color = '800000'
    elseif color ==? 'MediumAquaMarine'     | let color = '66cdaa'
    elseif color ==? 'MediumBlue'           | let color = '0000cd'
    elseif color ==? 'MediumOrchid'         | let color = 'ba55d3'
    elseif color ==? 'MediumPurple'         | let color = '9370d8'
    elseif color ==? 'MediumSeaGreen'       | let color = '3cb371'
    elseif color ==? 'MediumSlateBlue'      | let color = '7b68ee'
    elseif color ==? 'MediumSpringGreen'    | let color = '00fa9a'
    elseif color ==? 'MediumTurquoise'      | let color = '48d1cc'
    elseif color ==? 'MediumVioletRed'      | let color = 'c71585'
    elseif color ==? 'MidnightBlue'         | let color = '191970'
    elseif color ==? 'MintCream'            | let color = 'f5fffa'
    elseif color ==? 'MistyRose'            | let color = 'ffe4e1'
    elseif color ==? 'Moccasin'             | let color = 'ffe4b5'
    elseif color ==? 'NavajoWhite'          | let color = 'ffdead'
    elseif color ==? 'Navy'                 | let color = '000080'
    elseif color ==? 'OldLace'              | let color = 'fdf5e6'
    elseif color ==? 'Olive'                | let color = '808000'
    elseif color ==? 'OliveDrab'            | let color = '6b8e23'
    elseif color ==? 'Orange'               | let color = 'ffa500'
    elseif color ==? 'OrangeRed'            | let color = 'ff4500'
    elseif color ==? 'Orchid'               | let color = 'da70d6'
    elseif color ==? 'PaleGoldenRod'        | let color = 'eee8aa'
    elseif color ==? 'PaleGreen'            | let color = '98fb98'
    elseif color ==? 'PaleTurquoise'        | let color = 'afeeee'
    elseif color ==? 'PaleVioletRed'        | let color = 'd87093'
    elseif color ==? 'PapayaWhip'           | let color = 'ffefd5'
    elseif color ==? 'PeachPuff'            | let color = 'ffdab9'
    elseif color ==? 'Peru'                 | let color = 'cd853f'
    elseif color ==? 'Pink'                 | let color = 'ffc0cb'
    elseif color ==? 'Plum'                 | let color = 'dda0dd'
    elseif color ==? 'PowderBlue'           | let color = 'b0e0e6'
    elseif color ==? 'Purple'               | let color = '800080'
    elseif color ==? 'Red'                  | let color = 'ff0000'
    elseif color ==? 'RosyBrown'            | let color = 'bc8f8f'
    elseif color ==? 'RoyalBlue'            | let color = '4169e1'
    elseif color ==? 'SaddleBrown'          | let color = '8b4513'
    elseif color ==? 'Salmon'               | let color = 'fa8072'
    elseif color ==? 'SandyBrown'           | let color = 'f4a460'
    elseif color ==? 'SeaGreen'             | let color = '2e8b57'
    elseif color ==? 'SeaShell'             | let color = 'fff5ee'
    elseif color ==? 'Sienna'               | let color = 'a0522d'
    elseif color ==? 'Silver'               | let color = 'c0c0c0'
    elseif color ==? 'SkyBlue'              | let color = '87ceeb'
    elseif color ==? 'SlateBlue'            | let color = '6a5acd'
    elseif color ==? 'SlateGray'            | let color = '708090'
    elseif color ==? 'Snow'                 | let color = 'fffafa'
    elseif color ==? 'SpringGreen'          | let color = '00ff7f'
    elseif color ==? 'SteelBlue'            | let color = '4682b4'
    elseif color ==? 'Tan'                  | let color = 'd2b48c'
    elseif color ==? 'Teal'                 | let color = '008080'
    elseif color ==? 'Thistle'              | let color = 'd8bfd8'
    elseif color ==? 'Tomato'               | let color = 'ff6347'
    elseif color ==? 'Turquoise'            | let color = '40e0d0'
    elseif color ==? 'Violet'               | let color = 'ee82ee'
    elseif color ==? 'Wheat'                | let color = 'f5deb3'
    elseif color ==? 'White'                | let color = 'ffffff'
    elseif color ==? 'WhiteSmoke'           | let color = 'f5f5f5'
    elseif color ==? 'Yellow'               | let color = 'ffff00'
    elseif color ==? 'YellowGreen'          | let color = '9acd32'

    else
      "echoerr "Wrong color value '".color."'!"
      let color = ''
    endif
  endif

  " color value is hexadecimally and short (000)
  if strlen(color) == 3
    let color = strpart(color, 0, 1).strpart(color, 0, 1).strpart(color, 1, 1).strpart(color, 1, 1).strpart(color, 2, 1).strpart(color, 2, 1)
  elseif strlen(color) != 6
    "echoerr "Wrong color value '".color."'!"
    let color = ''
  endif
  return color
endfun

function! s:setColor(string)
  let color = s:translateColor(a:string)
  if color == ''
    return 0
  endif
  exe 'let s:red=0x'.   strpart(color, 0, 2)
  exe 'let s:green=0x'. strpart(color, 2, 2)
  exe 'let s:blue=0x'.  strpart(color, 4, 2)
  call s:updateHSV()
  return 1
endfun

function! ColorSel(...)
  " set color to rrggbb argument with optional # prefix
  if a:0
    if !s:setColor(a:1)
      echohl WarningMsg
      let v:warningmsg = "Invalid color value '".a:1."'."
      echomsg v:warningmsg
      echohl None
    elseif s:showSwatchDifference
      let s:altColor = s:currentcolor()
    endif
  else
    let s:altColor = ''
  endif

  if exists('s:bufno') && bufexists(s:bufno) && bufwinnr(s:bufno) > -1
    exec bufwinnr(s:bufno) . 'wincmd w'
    if a:0
      call s:update()
      call s:updateAlt()
      call setline(s:swatchSize + 2, s:swatchBottom())
    endif
    return
  endif

  if !exists('s:red')
    let s:red = 127
    let s:green = 127
    let s:blue = 127
    let s:value = 127
    let s:hue = 0
    let s:saturation = 0
    let s:altColor = ''
  endif

  exec 'silent split ' . s:bufname
  if !exists('s:bufno') || !bufexists(s:bufno)
    let s:bufno = bufnr('%')
  endif
  setlocal buftype=nowrite
  setlocal bufhidden=delete
  setlocal nolist
  setlocal noswapfile
  if exists('+cursorline') && (&cursorline || &cursorcolumn)
    " Cursor movement is not used in the Color Selector window, so turn off the
    " cursorline/column.
    setlocal nocursorline nocursorcolumn
    " Some users use an autocmd to turn on cursorline/column only for the
    " current window; suppress that, too.
    autocmd WinEnter <buffer> setlocal nocursorline nocursorcolumn
  endif
  call s:drawSwatch()
  let shift = s:swatchSize > 8 ? 1 : 0
  call setline(8 + shift, s:space . '  jk switch   0bjlw$ change values' . (s:showPalette ? '   "xp' . (s:showSwatchDifference ? '/P' : '') . ' use palette entry x' : ''))
  call setline(9 + shift, s:space . '   q quit  ' . (s:showSwatchDifference ? 'x swap ' : '       ') . ' y yank #rrggbb ' . (s:showPalette ? '   "xy store in entry x' : ''))
  exec 'resize ' . (s:swatchSize + 2)
  1

  syn match colorselKey " \(jk\|0bjlw\$\|[qxy]\|\"xp/P\|\"xy\) "ms=s+1,me=e-1
  syn match colorselColor "^| \+|"ms=s+1,me=e-1
  syn match colorselRedS "R \[" nextgroup=colorselRed0
  syn match colorselGreenS "G \[" nextgroup=colorselGreen0
  syn match colorselBlueS "B \[" nextgroup=colorselBlue0
  syn match colorselHueS "H \[" nextgroup=colorselHue0
  syn match colorselSaturationS "S \[" nextgroup=colorselSaturation0
  syn match colorselValueS "V \[" nextgroup=colorselValue0
  syn match colorselPaletteA "a:\x\{6} \{5}"ms=s+9
  syn match colorselPaletteB "b:\x\{6} \{5}"ms=s+9
  syn match colorselPaletteC "c:\x\{6} \{5}"ms=s+9
  syn match colorselPaletteD "d:\x\{6} \{5}"ms=s+9
  syn match colorselPaletteE "e:\x\{6} \{5}"ms=s+9
  syn match colorselPaletteF "f:\x\{6} \{5}"ms=s+9
  syn match colorselPaletteG " \{5}g:\x\{6}"me=e-9
  syn match colorselPaletteH " \{5}h:\x\{6}"me=e-9
  syn match colorselPaletteI " \{5}i:\x\{6}"me=e-9
  syn match colorselPaletteJ " \{5}j:\x\{6}"me=e-9
  syn match colorselPaletteK " \{5}k:\x\{6}"me=e-9
  syn match colorselPaletteL " \{5}l:\x\{6}"me=e-9
  let i = 0
  while i < s:sliderSize
    let c = 'colorselRed'
    exec 'syn match ' . c . i . ' "[ #]" nextgroup=' . c . (i+1) . ' contained'
    let c = 'colorselGreen'
    exec 'syn match ' . c . i . ' "[ #]" nextgroup=' . c . (i+1) . ' contained'
    let c = 'colorselBlue'
    exec 'syn match ' . c . i . ' "[ #]" nextgroup=' . c . (i+1) . ' contained'
    let c = 'colorselHue'
    exec 'syn match ' . c . i . ' "[ #]" nextgroup=' . c . (i+1) . ' contained'
    let c = 'colorselSaturation'
    exec 'syn match ' . c . i . ' "[ #]" nextgroup=' . c . (i+1) . ' contained'
    let c = 'colorselValue'
    exec 'syn match ' . c . i . ' "[ #]" nextgroup=' . c . (i+1) . ' contained'
    let i = i+1
  endwhile
  call s:hiRGB()
  call s:updateAlt()

  hi colorselKey gui=bold

  " vi-style controls
  nnoremap <buffer><silent> k :call <SID>activeUp()<cr>
  nnoremap <buffer><silent> j :call <SID>activeDown()<cr>
  nnoremap <buffer><silent> h :call <SID>dec()<cr>
  nnoremap <buffer><silent> l :call <SID>inc()<cr>
  nnoremap <buffer><silent> 0 :call <SID>begin()<cr>
  nnoremap <buffer><silent> $ :call <SID>end()<cr>
  nnoremap <buffer><silent> w :call <SID>pginc()<cr>
  nnoremap <buffer><silent> b :call <SID>pgdec()<cr>
  " loser-style controls ;-)
  nnoremap <buffer><silent> <up> :call <SID>activeUp()<cr>
  nnoremap <buffer><silent> <down> :call <SID>activeDown()<cr>
  nnoremap <buffer><silent> <left> :call <SID>dec()<cr>
  nnoremap <buffer><silent> <right> :call <SID>inc()<cr>
  nnoremap <buffer><silent> <home> :call <SID>begin()<cr>
  nnoremap <buffer><silent> <end> :call <SID>end()<cr>
  nnoremap <buffer><silent> <pageup> :call <SID>pginc()<cr>
  nnoremap <buffer><silent> <pagedown> :call <SID>pgdec()<cr>
  " other controls
  nnoremap <buffer><silent> p :call <SID>paste()<cr>
  nnoremap <buffer><silent> P :call <SID>pasteAlt()<cr>
  nnoremap <buffer><silent> y :call <SID>yank()<cr>
  nnoremap <buffer><silent> x :call <SID>swap()<cr>
  nnoremap <buffer><silent> q :close!<cr>

  call s:update()
endfun

command! -nargs=? ColorSel call ColorSel(<f-args>)
" vim: set et ts=2 :

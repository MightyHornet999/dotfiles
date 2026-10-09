import QtQuick
import Quickshell


QtObject {
  // Backgrounds
  property color bg1: "{{ background | lower }}"
  property color bg2: "{{ color12 | lower }}"

  // Accents
  property color color0: "{{ color0 | lower }}"
  property color color1: "{{ color1 | lower }}"
  property color color2: "{{ color2 | lower }}"
  property color color3: "{{ color3 | lower }}"
  property color color4: "{{ color4 | lower }}"
  property color color5: "{{ color5 | lower }}"
  property color color6: "{{ color6 | lower }}"
  property color color7: "{{ color7 | lower }}"
  property color color8: "{{ color8 | lower }}"
  property color color9: "{{ color9 | lower }}"
  property color color10: "{{ color10 | lower }}"
  property color color11: "{{ color11 | lower }}"
   
  // Text
  property color fg1: "{{ foreground | lower }}"

}

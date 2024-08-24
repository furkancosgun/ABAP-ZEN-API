CLASS zcl_zen_api_content_types DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CONSTANTS:
      " Text-based content types
      c_text_html                   TYPE string VALUE 'text/html',       " HTML file
      c_text_plain                  TYPE string VALUE 'text/plain',      " Plain text file
      c_text_css                    TYPE string VALUE 'text/css',        " CSS stylesheet file
      c_text_javascript             TYPE string VALUE 'text/javascript', " JavaScript file
      c_text_richtext               TYPE string VALUE 'text/richtext',   " MIME rich text
      c_text_xml                    TYPE string VALUE 'text/xml',        " XML file

      " Image content types
      c_image_gif                   TYPE string VALUE 'image/gif',        " GIF graphic
      c_image_ief                   TYPE string VALUE 'image/ief',        " Image Exchange Format
      c_image_jpeg                  TYPE string VALUE 'image/jpeg',       " JPEG graphic
      c_image_x_rgb                 TYPE string VALUE 'image/x-rgb',      " RGB graphic
      c_image_x_windowdump          TYPE string VALUE 'image/x-windowdump', " X-Windows dump
      c_image_tiff                  TYPE string VALUE 'image/tiff',      " TIFF graphic
      c_image_bmp                   TYPE string VALUE 'image/bmp',       " Bitmap graphic
      c_image_ico                   TYPE string VALUE 'image/ico',       " Icon (Windows)

      " Audio content types
      c_audio_basic                 TYPE string VALUE 'audio/basic',     " AU and SND sound files
      c_audio_x_aiff                TYPE string VALUE 'audio/x-aiff',    " AIFF sound file
      c_audio_x_midi                TYPE string VALUE 'audio/x-midi',    " MIDI file
      c_audio_x_pn_realaudio        TYPE string VALUE 'audio/x-pn-realaudio', " RealAudio file
      c_audio_x_pn_realaudio_plugin TYPE string VALUE 'audio/x-pn-realaudio-plugin', " RealAudio plug-in file

      " Video content types
      c_video_mpeg                  TYPE string VALUE 'video/mpeg',      " MPEG video
      c_video_x_msvideo             TYPE string VALUE 'video/x-msvideo', " Microsoft AVI video
      c_video_x_sgi_movie           TYPE string VALUE 'video/x-sgi-movie', " SGI video
      c_video_quicktime             TYPE string VALUE 'video/quicktime', " Quicktime video

      " Application-based content types
      c_application_acad            TYPE string VALUE 'application/acad',   " AutoCAD file
      c_application_dxf             TYPE string VALUE 'application/dxf',    " AutoCAD file
      c_application_mif             TYPE string VALUE 'application/mif',    " Maker Interchange Format (Adobe FrameMaker)
      c_application_msword          TYPE string VALUE 'application/msword', " MS Word file
      c_application_mspowerpoint    TYPE string VALUE 'application/mspowerpoint', " MS PowerPoint file
      c_application_msexcel         TYPE string VALUE 'application/msexcel', " MS Excel file
      c_application_mshelp          TYPE string VALUE 'application/mshelp', " MS Windows help file
      c_application_octet           TYPE string VALUE 'application/octet-stream', " Executable file or program code file
      c_application_pdf             TYPE string VALUE 'application/pdf',   " PDF file (Adobe Acrobat Reader)
      c_application_postscript      TYPE string VALUE 'application/postscript', " Postscript file (Adobe)
      c_application_rtf             TYPE string VALUE 'application/rtf',   " RTF file (Microsoft)
      c_application_json            TYPE string VALUE 'application/json',  " JSON file
      c_application_yaml            TYPE string VALUE 'application/x-yaml', " YAML file
      c_application_rss             TYPE string VALUE 'application/rss+xml', " RSS file
      c_application_xspf            TYPE string VALUE 'application/xspf+xml'. " XSPF playlist file

ENDCLASS.



CLASS ZCL_ZEN_API_CONTENT_TYPES IMPLEMENTATION.
ENDCLASS.

HEADER
; IDL Visual Widget Builder Resource file. Version 1
; Generated on:	09/05/2007 13:20.33
VERSION 1
END

WID_fit2d_shell BASE 0 5 1003 801
TLB
CAPTION "Fit2d_shell   ver 1.0 beta"
XPAD = 3
YPAD = 3
SPACE = 3
BEGIN
  WID_BUTTON_1 PUSHBUTTON 789 730 199 28
  VALUE "Close"
  ALIGNCENTER
  END
  WID_DRAW_2 DRAW 423 39 364 269
  END
  WID_TAB_0 TAB 4 34 416 274
  BEGIN
    WID_BASE_1 BASE 0 0 408 248
    XPAD = 3
    YPAD = 3
    SPACE = 3
    CAPTION "Fit2d"
    BEGIN
      WID_TAB_2 TAB 0 2 330 243
      BEGIN
        WID_BASE_15 BASE 0 0 322 217
        XPAD = 3
        YPAD = 3
        SPACE = 3
        CAPTION "Integrate"
        BEGIN
          WID_BASE_32 BASE 0 0 601 462
          XPAD = 3
          YPAD = 3
          SPACE = 3
          CAPTION "Integrate"
          BEGIN
            WID_BUTTON_24 PUSHBUTTON 169 11 66 35
            VALUE "=>>"
            ALIGNCENTER
            END
            WID_BUTTON_26 PUSHBUTTON 13 11 151 35
            VALUE "Integrate"
            ALIGNCENTER
            END
            WID_TEXT_70 TEXT 16 107 78 21
            WIDTH = 20
            HEIGHT = 1
            END
            WID_TEXT_71 TEXT 100 106 78 21
            WIDTH = 20
            HEIGHT = 1
            END
            WID_TEXT_72 TEXT 100 82 78 21
            WIDTH = 20
            HEIGHT = 1
            END
            WID_TEXT_73 TEXT 16 83 78 21
            WIDTH = 20
            HEIGHT = 1
            END
            WID_LABEL_38 LABEL 17 61 0 0
            VALUE "File series range"
            ALIGNLEFT
            END
          END
        END
        WID_BASE_33 BASE 0 0 322 217
        XPAD = 3
        YPAD = 3
        SPACE = 3
        CAPTION "Calibrate"
        BEGIN
          WID_BUTTON_61 PUSHBUTTON 210 125 107 35
          VALUE "Get calibration"
          ALIGNCENTER
          END
          WID_BUTTON_60 PUSHBUTTON 209 162 108 35
          VALUE "Set calibration"
          ALIGNCENTER
          END
          WID_BUTTON_20 PUSHBUTTON 209 49 106 35
          VALUE "Read calibration"
          ALIGNCENTER
          END
          WID_BUTTON_19 PUSHBUTTON 209 86 107 35
          VALUE "Write calibration"
          ALIGNCENTER
          END
          WID_BUTTON_17 PUSHBUTTON 209 12 106 35
          VALUE "Run calibration"
          ALIGNCENTER
          END
          WID_TEXT_19 TEXT 79 16 0 0
          EDITABLE
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_18 TEXT 79 39 0 0
          EDITABLE
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_17 TEXT 79 63 0 0
          EDITABLE
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_16 TEXT 79 86 0 0
          EDITABLE
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_80 TEXT 79 178 0 0
          EDITABLE
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_81 TEXT 79 155 0 0
          EDITABLE
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_82 TEXT 79 131 0 0
          EDITABLE
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_83 TEXT 79 108 0 0
          EDITABLE
          WIDTH = 20
          HEIGHT = 1
          END
          WID_LABEL_40 LABEL 11 18 0 0
          VALUE "pix size x"
          ALIGNLEFT
          END
          WID_LABEL_41 LABEL 11 40 0 0
          VALUE "pix size y"
          ALIGNLEFT
          END
          WID_LABEL_42 LABEL 11 64 0 0
          VALUE "distance"
          ALIGNLEFT
          END
          WID_LABEL_43 LABEL 11 87 0 0
          VALUE "wavelength"
          ALIGNLEFT
          END
          WID_LABEL_44 LABEL 11 110 0 0
          VALUE "beam x"
          ALIGNLEFT
          END
          WID_LABEL_45 LABEL 11 133 0 0
          VALUE "beam y"
          ALIGNLEFT
          END
          WID_LABEL_46 LABEL 10 157 0 0
          VALUE "rotation"
          ALIGNLEFT
          END
          WID_LABEL_47 LABEL 10 181 0 0
          VALUE "tilt"
          ALIGNLEFT
          END
        END
        WID_BASE_34 BASE 0 0 322 217
        XPAD = 3
        YPAD = 3
        SPACE = 3
        CAPTION "Mask"
        BEGIN
          WID_BUTTON_48 PUSHBUTTON 14 160 124 35
          VALUE "Clear mask"
          ALIGNCENTER
          END
          WID_BUTTON_47 PUSHBUTTON 14 124 124 35
          VALUE "Pick mask file"
          ALIGNCENTER
          END
          WID_BUTTON_32 PUSHBUTTON 14 88 124 35
          VALUE "Create mask"
          ALIGNCENTER
          END
          WID_BASE_35 BASE 15 23 0 0
          COLUMNS = 1
          NONEXCLUSIVE
          CAPTION "IDL"
          BEGIN
            WID_BUTTON_31 PUSHBUTTON -1 -1 0 0
            VALUE "Use mask"
            ALIGNLEFT
            END
          END
          WID_TEXT_4 TEXT 14 58 299 21
          WIDTH = 20
          HEIGHT = 1
          END
        END
        WID_BASE_36 BASE 0 0 322 217
        XPAD = 3
        YPAD = 3
        SPACE = 3
        CAPTION "Misc."
        BEGIN
          WID_TAB_6 TAB 6 101 287 101
          BEGIN
            WID_BASE_37 BASE 0 0 279 75
            XPAD = 3
            YPAD = 3
            SPACE = 3
            CAPTION "Z-scale"
            BEGIN
              WID_BUTTON_54 PUSHBUTTON 13 21 0 0
              VALUE "Max +"
              ALIGNCENTER
              END
              WID_BUTTON_55 PUSHBUTTON 60 21 0 0
              VALUE "Max -"
              ALIGNCENTER
              END
              WID_BUTTON_56 PUSHBUTTON 60 45 41 22
              VALUE "Min -"
              ALIGNCENTER
              END
              WID_BUTTON_57 PUSHBUTTON 13 45 44 22
              VALUE "Min +"
              ALIGNCENTER
              END
              WID_BUTTON_58 PUSHBUTTON 159 45 80 22
              VALUE "Log scale"
              ALIGNCENTER
              END
              WID_BUTTON_59 PUSHBUTTON 158 22 81 22
              VALUE "Weak peaks"
              ALIGNCENTER
              END
            END
          END
          WID_BUTTON_37 PUSHBUTTON 6 64 76 29
          VALUE "Exit"
          ALIGNCENTER
          END
          WID_BUTTON_36 PUSHBUTTON 6 35 76 29
          VALUE "Cancel"
          ALIGNCENTER
          END
          WID_BUTTON_35 PUSHBUTTON 6 5 76 29
          VALUE "O.K."
          ALIGNCENTER
          END
          WID_BUTTON_34 PUSHBUTTON 84 35 76 29
          VALUE "Powder"
          ALIGNCENTER
          END
          WID_BUTTON_33 PUSHBUTTON 84 64 76 29
          VALUE "Exchange"
          ALIGNCENTER
          END
        END
        WID_BASE_38 BASE 0 0 322 217
        XPAD = 3
        YPAD = 3
        SPACE = 3
        CAPTION "File"
        BEGIN
          WID_BUTTON_29 PUSHBUTTON 271 41 34 35
          VALUE "->"
          ALIGNCENTER
          END
          WID_BUTTON_28 PUSHBUTTON 225 41 34 35
          VALUE "<-"
          ALIGNCENTER
          END
          WID_BUTTON_27 PUSHBUTTON 7 40 78 35
          VALUE "Open image"
          ALIGNCENTER
          END
          WID_TEXT_12 TEXT 8 13 299 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_89 TEXT 10 150 78 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_90 TEXT 93 149 78 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_91 TEXT 93 123 78 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_92 TEXT 10 124 78 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_LABEL_51 LABEL 11 102 0 0
          VALUE "File series range"
          ALIGNLEFT
          END
          WID_BASE_20 BASE 144 184 0 0
          COLUMNS = 1
          NONEXCLUSIVE
          CAPTION "IDL"
          BEGIN
            WID_BUTTON_84 PUSHBUTTON -1 -1 0 0
            VALUE "Autoprocess new files"
            ALIGNLEFT
            END
          END
        END
      END
      WID_BUTTON_13 PUSHBUTTON 334 23 69 32
      VALUE "Start"
      ALIGNCENTER
      END
      WID_BUTTON_14 PUSHBUTTON 334 91 69 32
      VALUE "Locate"
      ALIGNCENTER
      END
      WID_BUTTON_69 PUSHBUTTON 334 57 69 32
      VALUE "Close"
      ALIGNCENTER
      END
    END
    WID_BASE_4 BASE 0 0 408 248
    XPAD = 3
    YPAD = 3
    SPACE = 3
    CAPTION "Phases"
    BEGIN
      WID_BUTTON_0 PUSHBUTTON 18 22 92 29
      VALUE "Add phase"
      ALIGNCENTER
      END
      WID_TEXT_0 TEXT 228 23 85 21
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      WID_LABEL_0 LABEL 229 3 0 0
      VALUE "Pressure [GPa]"
      ALIGNLEFT
      END
      WID_BUTTON_2 PUSHBUTTON 226 108 92 29
      VALUE "Recalculate"
      ALIGNCENTER
      END
      WID_BUTTON_3 PUSHBUTTON 18 52 92 29
      VALUE "Delete phase"
      ALIGNCENTER
      END
      WID_BUTTON_4 PUSHBUTTON 18 82 92 29
      VALUE "Clear phases"
      ALIGNCENTER
      END
      WID_BUTTON_49 PUSHBUTTON 130 21 18 22
      VALUE "<"
      ALIGNCENTER
      END
      WID_BUTTON_50 PUSHBUTTON 194 21 18 22
      VALUE ">"
      ALIGNCENTER
      END
      WID_TEXT_30 TEXT 153 22 37 21
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      WID_BASE_0 BASE 21 136 0 0
      COLUMNS = 1
      NONEXCLUSIVE
      CAPTION "IDL"
      BEGIN
        WID_BUTTON_5 PUSHBUTTON -1 -1 0 0
        VALUE "Hide phase"
        ALIGNLEFT
        END
      END
      WID_BASE_2 BASE 21 169 0 0
      COLUMNS = 1
      NONEXCLUSIVE
      CAPTION "IDL"
      BEGIN
        WID_BUTTON_6 PUSHBUTTON -1 -1 0 0
        VALUE "Show HKL labels"
        ALIGNLEFT
        END
      END
      WID_BASE_7 BASE 21 202 0 0
      COLUMNS = 1
      NONEXCLUSIVE
      CAPTION "IDL"
      BEGIN
        WID_BUTTON_12 PUSHBUTTON -1 -1 0 0
        VALUE "Show legend"
        ALIGNLEFT
        END
      END
      WID_TEXT_31 TEXT 153 75 37 21
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      WID_BUTTON_63 PUSHBUTTON 194 74 18 22
      VALUE ">"
      ALIGNCENTER
      END
      WID_BUTTON_64 PUSHBUTTON 130 74 18 22
      VALUE "<"
      ALIGNCENTER
      END
      WID_LABEL_7 LABEL 229 56 0 0
      VALUE "Temperature [K]"
      ALIGNLEFT
      END
      WID_TEXT_21 TEXT 228 76 85 21
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_7 TEXT 259 202 56 25
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      WID_BUTTON_65 PUSHBUTTON 227 202 26 26
      VALUE "-"
      ALIGNCENTER
      END
      WID_BUTTON_68 PUSHBUTTON 320 200 26 26
      VALUE "+"
      ALIGNCENTER
      END
      WID_TEXT_36 TEXT 259 175 56 25
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      WID_LABEL_12 LABEL 238 153 0 0
      VALUE "Scale"
      ALIGNLEFT
      END
    END
    WID_BASE_5 BASE 0 0 408 248
    XPAD = 3
    YPAD = 3
    SPACE = 3
    CAPTION "Spectrum"
    BEGIN
      WID_BUTTON_30 PUSHBUTTON 16 42 78 35
      VALUE "Open chi"
      ALIGNCENTER
      END
      WID_BUTTON_38 PUSHBUTTON 292 43 34 35
      VALUE "->"
      ALIGNCENTER
      END
      WID_BUTTON_39 PUSHBUTTON 256 43 34 35
      VALUE "<-"
      ALIGNCENTER
      END
      WID_TEXT_3 TEXT 16 14 310 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_BUTTON_62 PUSHBUTTON 96 42 78 35
      VALUE "Save chi"
      ALIGNCENTER
      END
      WID_LABEL_49 LABEL 17 144 0 0
      VALUE "File series range"
      ALIGNLEFT
      END
      WID_TEXT_85 TEXT 16 166 78 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_86 TEXT 99 165 78 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_87 TEXT 99 191 78 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_88 TEXT 16 192 78 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_LABEL_50 LABEL 17 87 0 0
      VALUE "wavelength"
      ALIGNLEFT
      END
      WID_TEXT_20 TEXT 16 107 93 21
      EDITABLE
      WIDTH = 20
      HEIGHT = 1
      END
      WID_BUTTON_71 PUSHBUTTON 57 213 121 24
      VALUE "Truncate to zoom"
      ALIGNCENTER
      END
      WID_BASE_21 BASE 256 90 0 0
      COLUMNS = 1
      EXCLUSIVE
      CAPTION "IDL"
      BEGIN
        WID_BUTTON_85 PUSHBUTTON -1 -1 0 0
        VALUE "Keep overlays"
        ALIGNLEFT
        END
        WID_BUTTON_86 PUSHBUTTON -1 -1 0 0
        VALUE "Advance overlays"
        ALIGNLEFT
        END
        WID_BUTTON_93 PUSHBUTTON -1 -1 0 0
        VALUE "Delete overlays"
        ALIGNLEFT
        END
      END
      WID_BASE_22 BASE 255 179 0 0
      COLUMNS = 1
      NONEXCLUSIVE
      CAPTION "IDL"
      BEGIN
        WID_BUTTON_92 PUSHBUTTON -1 -1 0 0
        VALUE "Automatic background"
        ALIGNLEFT
        END
      END
    END
    WID_BASE_3 BASE 0 0 408 248
    XPAD = 3
    YPAD = 3
    SPACE = 3
    CAPTION "Peak fit"
    BEGIN
      WID_TEXT_1 TEXT 166 31 73 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_LABEL_4 LABEL 169 6 0 0
      VALUE "Window"
      ALIGNLEFT
      END
      WID_BUTTON_53 PUSHBUTTON 18 15 127 39
      VALUE "Fit"
      ALIGNCENTER
      END
      WID_BASE_9 BASE 58 92 0 0
      COLUMNS = 1
      EXCLUSIVE
      CAPTION "IDL"
      BEGIN
        WID_BUTTON_72 PUSHBUTTON -1 -1 0 0
        VALUE "Gaussian"
        ALIGNLEFT
        END
        WID_BUTTON_73 PUSHBUTTON -1 -1 0 0
        VALUE "Lorentzian"
        ALIGNLEFT
        END
        WID_BUTTON_74 PUSHBUTTON -1 -1 0 0
        VALUE "PearsonVII"
        ALIGNLEFT
        END
        WID_BUTTON_75 PUSHBUTTON -1 -1 0 0
        VALUE "Pseudo-Voigt"
        ALIGNLEFT
        END
      END
      WID_LABEL_13 LABEL 23 69 0 0
      VALUE "Profile function"
      ALIGNLEFT
      END
      WID_LABEL_14 LABEL 138 68 0 0
      VALUE "Profile background"
      ALIGNLEFT
      END
      WID_BASE_14 BASE 173 91 0 0
      COLUMNS = 1
      EXCLUSIVE
      CAPTION "IDL"
      BEGIN
        WID_BUTTON_76 PUSHBUTTON -1 -1 0 0
        VALUE "Linear"
        ALIGNLEFT
        END
        WID_BUTTON_77 PUSHBUTTON -1 -1 0 0
        VALUE "Constant"
        ALIGNLEFT
        END
        WID_BUTTON_78 PUSHBUTTON -1 -1 0 0
        VALUE "No background"
        ALIGNLEFT
        END
      END
    END
    WID_BASE_11 BASE 0 0 408 248
    XPAD = 3
    YPAD = 3
    SPACE = 3
    CAPTION "Unit cell"
    BEGIN
      WID_TEXT_8 TEXT 184 57 66 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_9 TEXT 184 36 66 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_10 TEXT 184 13 66 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_11 TEXT 183 133 66 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_22 TEXT 183 112 66 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_23 TEXT 183 89 66 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_24 TEXT 266 90 66 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_25 TEXT 266 113 66 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_26 TEXT 266 134 66 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_27 TEXT 267 14 66 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_28 TEXT 267 37 66 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_29 TEXT 267 58 66 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_DROPLIST_0 DROPLIST 37 48 126 22
      END
      WID_BUTTON_15 PUSHBUTTON 39 89 101 47
      VALUE "Refine"
      ALIGNCENTER
      END
      WID_LABEL_2 LABEL 37 26 0 0
      VALUE "Crystal system"
      ALIGNLEFT
      END
    END
    WID_BASE_13 BASE 0 0 408 248
    XPAD = 3
    YPAD = 3
    SPACE = 3
    CAPTION "BG"
    BEGIN
      WID_LABEL_19 LABEL 28 8 0 0
      VALUE "Sampling interval"
      ALIGNLEFT
      END
      WID_TEXT_32 TEXT 28 32 85 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_LABEL_20 LABEL 144 7 0 0
      VALUE "Tension"
      ALIGNLEFT
      END
      WID_TEXT_33 TEXT 144 31 85 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_BUTTON_51 PUSHBUTTON 8 77 94 37
      VALUE "Fit"
      ALIGNCENTER
      END
      WID_BUTTON_52 PUSHBUTTON 8 115 94 37
      VALUE "Subtract"
      ALIGNCENTER
      END
      WID_BUTTON_70 PUSHBUTTON 8 153 94 37
      VALUE "Save"
      ALIGNCENTER
      END
      WID_TEXT_34 TEXT 257 32 85 20
      WIDTH = 20
      HEIGHT = 1
      END
      WID_LABEL_21 LABEL 257 7 0 0
      VALUE "Marigin"
      ALIGNLEFT
      END
      WID_LIST_0 LIST 263 93 134 148
      WIDTH = 11
      HEIGHT = 2
      END
      WID_BUTTON_41 PUSHBUTTON 233 94 23 22
      VALUE "X"
      ALIGNCENTER
      END
      WID_LABEL_5 LABEL 238 70 0 0
      VALUE "Spline nodes"
      ALIGNLEFT
      END
      WID_TEXT_37 TEXT 163 185 43 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_BUTTON_79 PUSHBUTTON 163 158 43 24
      VALUE "+"
      ALIGNCENTER
      END
      WID_BUTTON_80 PUSHBUTTON 163 209 43 24
      VALUE "-"
      ALIGNCENTER
      END
      WID_BUTTON_81 PUSHBUTTON 209 184 43 24
      VALUE "+"
      ALIGNCENTER
      END
      WID_BUTTON_82 PUSHBUTTON 118 183 43 24
      VALUE "-"
      ALIGNCENTER
      END
    END
    WID_BASE_10 BASE 0 0 408 248
    XPAD = 3
    YPAD = 3
    SPACE = 3
    CAPTION "Output"
    BEGIN
      WID_BUTTON_8 PUSHBUTTON 13 20 117 41
      VALUE "Save graph"
      ALIGNCENTER
      END
      WID_BUTTON_9 PUSHBUTTON 133 20 117 41
      VALUE "Save peak fitting"
      ALIGNCENTER
      END
      WID_BUTTON_10 PUSHBUTTON 252 20 117 41
      VALUE "Save cell refinement"
      ALIGNCENTER
      END
      WID_BUTTON_11 PUSHBUTTON 13 63 117 41
      VALUE "Print graph"
      ALIGNCENTER
      END
    END
    WID_BASE_12 BASE 0 0 408 248
    XPAD = 3
    YPAD = 3
    SPACE = 3
    CAPTION "Overlays"
    BEGIN
      WID_BUTTON_44 PUSHBUTTON 11 60 90 25
      VALUE "Clear overlays"
      ALIGNCENTER
      END
      WID_BUTTON_43 PUSHBUTTON 11 34 90 25
      VALUE "Delete overlay"
      ALIGNCENTER
      END
      WID_BUTTON_42 PUSHBUTTON 11 7 90 25
      VALUE "Add overlay"
      ALIGNCENTER
      END
      WID_BUTTON_18 PUSHBUTTON 164 139 57 22
      VALUE "Reset"
      ALIGNCENTER
      END
      WID_BUTTON_16 PUSHBUTTON 162 63 57 22
      VALUE "Reset"
      ALIGNCENTER
      END
      WID_BUTTON_67 PUSHBUTTON 164 112 26 26
      VALUE "-"
      ALIGNCENTER
      END
      WID_BUTTON_66 PUSHBUTTON 257 110 26 26
      VALUE "+"
      ALIGNCENTER
      END
      WID_BUTTON_46 PUSHBUTTON 255 33 26 26
      VALUE "+"
      ALIGNCENTER
      END
      WID_BUTTON_45 PUSHBUTTON 162 35 26 26
      VALUE "-"
      ALIGNCENTER
      END
      WID_LABEL_48 LABEL 127 8 0 0
      VALUE "Overlay mltpl."
      ALIGNLEFT
      END
      WID_LABEL_9 LABEL 130 89 0 0
      VALUE "Overlay shift"
      ALIGNLEFT
      END
      WID_TEXT_2 TEXT 194 35 56 25
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_13 TEXT 290 33 68 25
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_14 TEXT 290 110 68 25
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_15 TEXT 195 112 55 25
      WIDTH = 20
      HEIGHT = 1
      END
      WID_BUTTON_23 PUSHBUTTON 10 147 94 34
      VALUE "Spread all"
      ALIGNCENTER
      END
      WID_BUTTON_25 PUSHBUTTON 10 184 94 34
      VALUE "Reset all"
      ALIGNCENTER
      END
      WID_BASE_6 BASE 310 213 0 0
      COLUMNS = 1
      NONEXCLUSIVE
      CAPTION "IDL"
      BEGIN
        WID_BUTTON_7 PUSHBUTTON -1 -1 0 0
        VALUE "Show legend"
        ALIGNLEFT
        END
      END
      WID_BASE_8 BASE 160 192 0 0
      COLUMNS = 1
      EXCLUSIVE
      CAPTION "IDL"
      BEGIN
        WID_BUTTON_21 PUSHBUTTON -1 -1 0 0
        VALUE "Add"
        ALIGNLEFT
        END
        WID_BUTTON_22 PUSHBUTTON -1 -1 0 0
        VALUE "Subtract"
        ALIGNLEFT
        END
      END
      WID_BUTTON_40 PUSHBUTTON 239 191 59 44
      VALUE "Execute"
      ALIGNCENTER
      END
    END
    WID_BASE_16 BASE 0 0 408 248
    XPAD = 3
    YPAD = 3
    SPACE = 3
    CAPTION "Peaks"
    BEGIN
      WID_LIST_1 LIST 231 31 170 211
      WIDTH = 11
      HEIGHT = 2
      END
      WID_TAB_1 TAB 4 1 201 241
      BEGIN
        WID_BASE_17 BASE 0 0 193 215
        XPAD = 3
        YPAD = 3
        SPACE = 3
        CAPTION "Match"
        BEGIN
          WID_BUTTON_87 PUSHBUTTON 10 7 72 22
          VALUE "Match"
          ALIGNCENTER
          END
          WID_BASE_19 BASE 13 181 0 0
          COLUMNS = 1
          NONEXCLUSIVE
          CAPTION "IDL"
          BEGIN
            WID_BUTTON_83 PUSHBUTTON -1 -1 0 0
            VALUE "Use intensities"
            ALIGNLEFT
            END
          END
          WID_TEXT_40 TEXT 117 182 65 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_LABEL_15 LABEL 12 38 0 0
          VALUE "Volume size range"
          ALIGNLEFT
          END
          WID_TEXT_41 TEXT 11 57 63 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_42 TEXT 84 57 63 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_43 TEXT 12 104 63 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_LABEL_16 LABEL 13 85 0 0
          VALUE "Match window size [deg]"
          ALIGNLEFT
          END
        END
        WID_BASE_18 BASE 0 0 193 215
        XPAD = 3
        YPAD = 3
        SPACE = 3
        CAPTION "Search"
        BEGIN
          WID_TEXT_44 TEXT 11 172 72 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_LABEL_24 LABEL 11 153 0 0
          VALUE "Separation"
          ALIGNLEFT
          END
          WID_TEXT_45 TEXT 11 125 72 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_LABEL_25 LABEL 11 106 0 0
          VALUE "Window"
          ALIGNLEFT
          END
          WID_LABEL_26 LABEL 10 55 0 0
          VALUE "Min I/sig(I)"
          ALIGNLEFT
          END
          WID_TEXT_46 TEXT 10 74 72 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_47 TEXT 10 26 72 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_LABEL_27 LABEL 10 7 0 0
          VALUE "Min I"
          ALIGNLEFT
          END
          WID_BUTTON_88 PUSHBUTTON 105 171 72 22
          VALUE "Save"
          ALIGNCENTER
          END
          WID_BUTTON_89 PUSHBUTTON 105 147 72 22
          VALUE "Delete"
          ALIGNCENTER
          END
          WID_BUTTON_90 PUSHBUTTON 104 24 70 23
          VALUE "Search"
          ALIGNCENTER
          END
        END
      END
      WID_TEXT_38 TEXT 231 4 73 21
      WIDTH = 20
      HEIGHT = 1
      END
      WID_TEXT_39 TEXT 325 4 73 21
      WIDTH = 20
      HEIGHT = 1
      END
    END
  END
  WID_LIST_10 LIST 793 326 194 189
  WIDTH = 11
  HEIGHT = 2
  END
  WID_TEXT_5 TEXT 804 59 68 21
  WIDTH = 20
  HEIGHT = 1
  END
  WID_TEXT_6 TEXT 916 61 68 21
  WIDTH = 20
  HEIGHT = 1
  END
  WID_LABEL_1 LABEL 805 40 0 0
  VALUE "2 theta"
  ALIGNLEFT
  END
  WID_LABEL_3 LABEL 898 65 0 0
  VALUE "d"
  ALIGNLEFT
  END
  WID_LIST_11 LIST 793 542 195 182
  WIDTH = 11
  HEIGHT = 2
  END
  WID_LABEL_8 LABEL 796 308 0 0
  VALUE "Phase"
  ALIGNLEFT
  END
  WID_LABEL_10 LABEL 793 525 0 0
  VALUE "Peak"
  ALIGNLEFT
  END
  WID_LABEL_11 LABEL 794 93 0 0
  VALUE "Overlay"
  ALIGNLEFT
  END
  WID_LIST_12 LIST 793 111 194 188
  WIDTH = 11
  HEIGHT = 2
  END
  WID_DRAW_0 DRAW 5 309 782 446
  END
  WID_TEXT_35 TEXT 917 82 68 21
  WIDTH = 20
  HEIGHT = 1
  END
  WID_LABEL_6 LABEL 898 89 0 0
  VALUE "Q"
  ALIGNLEFT
  END
END

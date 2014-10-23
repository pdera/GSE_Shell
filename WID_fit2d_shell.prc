HEADER
; IDL Visual Widget Builder Resource file. Version 1
; Generated on:	01/02/2012 11:27.15
VERSION 1
END

WID_fit2d_shell BASE 0 5 1015 801
TLB
CAPTION "GSE_shell   ver 1.01"
XPAD = 3
YPAD = 3
SPACE = 3
BEGIN
  WID_TAB_1 TAB 2 0 788 762
  BEGIN
    WID_BASE_21 BASE 0 0 780 736
    XPAD = 3
    YPAD = 3
    SPACE = 3
    CAPTION "Analysis"
    BEGIN
      WID_DRAW_0 DRAW 5 313 770 421
      END
      WID_DRAW_2 DRAW 422 42 356 266
      END
      WID_TAB_0 TAB 2 34 416 274
      BEGIN
        WID_BASE_1 BASE 0 0 408 248
        XPAD = 3
        YPAD = 3
        SPACE = 3
        CAPTION "Fit2d"
        BEGIN
          WID_TAB_2 TAB 0 1 330 243
          BEGIN
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
              WID_BUTTON_48 PUSHBUTTON 12 157 124 35
              VALUE "Clear mask"
              ALIGNCENTER
              END
              WID_BUTTON_47 PUSHBUTTON 288 42 26 22
              VALUE "..."
              ALIGNCENTER
              END
              WID_BUTTON_32 PUSHBUTTON 12 85 124 35
              VALUE "Create mask"
              ALIGNCENTER
              END
              WID_BASE_35 BASE 6 7 0 0
              COLUMNS = 1
              NONEXCLUSIVE
              CAPTION "IDL"
              BEGIN
                WID_BUTTON_31 PUSHBUTTON -1 -1 0 0
                VALUE "Use mask"
                ALIGNLEFT
                END
              END
              WID_TEXT_4 TEXT 5 42 278 21
              WIDTH = 20
              HEIGHT = 1
              END
              WID_TEXT_21 TEXT 184 147 61 21
              EDITABLE
              WIDTH = 20
              HEIGHT = 1
              END
              WID_BUTTON_6 PUSHBUTTON 183 170 62 22
              VALUE "Threshold"
              ALIGNCENTER
              END
              WID_BUTTON_85 PUSHBUTTON 12 121 124 35
              VALUE "Modify exsisting"
              ALIGNCENTER
              END
              WID_BASE_17 BASE 252 147 0 0
              COLUMNS = 1
              EXCLUSIVE
              CAPTION "IDL"
              BEGIN
                WID_BUTTON_76 PUSHBUTTON -1 -1 0 0
                VALUE "Max"
                ALIGNLEFT
                END
                WID_BUTTON_77 PUSHBUTTON -1 -1 0 0
                VALUE "Min"
                ALIGNLEFT
                END
              END
              WID_BASE_18 BASE 182 120 0 0
              COLUMNS = 1
              NONEXCLUSIVE
              CAPTION "IDL"
              BEGIN
                WID_BUTTON_78 PUSHBUTTON -1 -1 0 0
                VALUE "Auto apply"
                ALIGNLEFT
                END
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
              WID_TEXT_12 TEXT 4 25 203 21
              WIDTH = 20
              HEIGHT = 1
              END
              WID_TEXT_89 TEXT 5 189 78 21
              WIDTH = 20
              HEIGHT = 1
              END
              WID_TEXT_90 TEXT 88 188 78 21
              WIDTH = 20
              HEIGHT = 1
              END
              WID_TEXT_91 TEXT 88 162 78 21
              WIDTH = 20
              HEIGHT = 1
              END
              WID_TEXT_92 TEXT 5 163 78 21
              WIDTH = 20
              HEIGHT = 1
              END
              WID_LABEL_51 LABEL 6 141 0 0
              VALUE "File series range"
              ALIGNLEFT
              END
              WID_BASE_20 BASE 6 114 0 0
              COLUMNS = 1
              NONEXCLUSIVE
              CAPTION "IDL"
              BEGIN
                WID_BUTTON_84 PUSHBUTTON -1 -1 0 0
                VALUE "Autoprocess new files"
                ALIGNLEFT
                END
              END
              WID_BUTTON_82 PUSHBUTTON 215 84 19 22
              VALUE "..."
              ALIGNCENTER
              END
              WID_LABEL_55 LABEL 4 67 0 0
              VALUE "Image directory"
              ALIGNLEFT
              END
              WID_TEXT_38 TEXT 4 85 202 21
              WIDTH = 20
              HEIGHT = 1
              END
              WID_BUTTON_28 PUSHBUTTON 239 24 34 21
              VALUE "<-"
              ALIGNCENTER
              END
              WID_BUTTON_29 PUSHBUTTON 275 24 34 21
              VALUE "->"
              ALIGNCENTER
              END
              WID_BUTTON_27 PUSHBUTTON 215 24 19 21
              VALUE "..."
              ALIGNCENTER
              END
              WID_LABEL_56 LABEL 6 5 0 0
              VALUE "Image file"
              ALIGNLEFT
              END
              WID_BUTTON_89 PUSHBUTTON 214 48 95 24
              VALUE "Open interact."
              ALIGNCENTER
              END
              WID_BUTTON_93 PUSHBUTTON 284 141 28 20
              VALUE "=>>"
              ALIGNCENTER
              END
              WID_BUTTON_94 PUSHBUTTON 176 142 100 20
              VALUE "Integrate"
              ALIGNCENTER
              END
              WID_BUTTON_95 PUSHBUTTON 175 166 100 20
              VALUE "Cake"
              ALIGNCENTER
              END
              WID_BUTTON_96 PUSHBUTTON 175 190 100 20
              VALUE "Cake interactive"
              ALIGNCENTER
              END
              WID_BUTTON_97 PUSHBUTTON 215 113 98 20
              VALUE "Exchange"
              ALIGNCENTER
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
          WID_BUTTON_3 PUSHBUTTON 18 52 92 29
          VALUE "Delete phase"
          ALIGNCENTER
          END
          WID_BUTTON_4 PUSHBUTTON 18 82 92 29
          VALUE "Clear phases"
          ALIGNCENTER
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
          WID_TEXT_7 TEXT 257 202 56 25
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
          WID_TEXT_36 TEXT 258 175 56 25
          EDITABLE
          WIDTH = 20
          HEIGHT = 1
          END
          WID_BUTTON_98 PUSHBUTTON 18 124 92 22
          VALUE "Save phase set"
          ALIGNCENTER
          END
          WID_BUTTON_99 PUSHBUTTON 18 150 92 22
          VALUE "Load phase set"
          ALIGNCENTER
          END
          WID_BUTTON_100 PUSHBUTTON 115 81 65 30
          VALUE "Edit"
          ALIGNCENTER
          END
          WID_LABEL_14 LABEL 223 151 0 0
          VALUE "Vertical scale"
          ALIGNLEFT
          END
        END
        WID_BASE_5 BASE 0 0 408 248
        XPAD = 3
        YPAD = 3
        SPACE = 3
        CAPTION "Spectrum"
        BEGIN
          WID_BUTTON_30 PUSHBUTTON 309 29 19 21
          VALUE "..."
          ALIGNCENTER
          END
          WID_BUTTON_38 PUSHBUTTON 369 29 34 21
          VALUE "->"
          ALIGNCENTER
          END
          WID_BUTTON_39 PUSHBUTTON 333 29 34 21
          VALUE "<-"
          ALIGNCENTER
          END
          WID_TEXT_3 TEXT 16 29 283 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_BUTTON_62 PUSHBUTTON 127 122 108 25
          VALUE "Save chi"
          ALIGNCENTER
          END
          WID_LABEL_49 LABEL 155 171 0 0
          VALUE "File series range"
          ALIGNLEFT
          END
          WID_TEXT_85 TEXT 154 193 78 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_86 TEXT 238 193 78 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_LABEL_50 LABEL 27 173 0 0
          VALUE "Wavelength"
          ALIGNLEFT
          END
          WID_TEXT_20 TEXT 26 193 93 21
          EDITABLE
          WIDTH = 20
          HEIGHT = 1
          END
          WID_BUTTON_71 PUSHBUTTON 16 122 108 25
          VALUE "Truncate to zoom"
          ALIGNCENTER
          END
          WID_LABEL_53 LABEL 18 8 0 0
          VALUE "Primary spectrum file"
          ALIGNLEFT
          END
          WID_BUTTON_81 PUSHBUTTON 309 74 19 22
          VALUE "..."
          ALIGNCENTER
          END
          WID_LABEL_54 LABEL 16 56 0 0
          VALUE "Spectra directory"
          ALIGNLEFT
          END
          WID_TEXT_31 TEXT 16 75 281 21
          WIDTH = 20
          HEIGHT = 1
          END
        END
        WID_BASE_3 BASE 0 0 408 248
        XPAD = 3
        YPAD = 3
        SPACE = 3
        CAPTION "Peak fit"
        BEGIN
          WID_TEXT_1 TEXT 22 84 73 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_LABEL_4 LABEL 25 63 0 0
          VALUE "Window"
          ALIGNLEFT
          END
          WID_BUTTON_53 PUSHBUTTON 18 15 127 39
          VALUE "Fit individual"
          ALIGNCENTER
          END
          WID_BASE_9 BASE 181 145 0 0
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
          WID_LABEL_13 LABEL 146 122 0 0
          VALUE "Profile function"
          ALIGNLEFT
          END
          WID_BASE_2 BASE 21 209 0 0
          COLUMNS = 1
          NONEXCLUSIVE
          CAPTION "IDL"
          BEGIN
            WID_BUTTON_21 PUSHBUTTON -1 -1 0 0
            VALUE "Save fitting results"
            ALIGNLEFT
            END
          END
          WID_BUTTON_91 PUSHBUTTON 156 14 127 39
          VALUE "LeBail"
          ALIGNCENTER
          END
          WID_LABEL_15 LABEL 158 61 0 0
          VALUE "Max width"
          ALIGNLEFT
          END
          WID_TEXT_43 TEXT 155 82 73 21
          WIDTH = 20
          HEIGHT = 1
          END
        END
        WID_BASE_11 BASE 0 0 408 248
        XPAD = 3
        YPAD = 3
        SPACE = 3
        CAPTION "Unit cell"
        BEGIN
          WID_TEXT_8 TEXT 213 56 66 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_9 TEXT 213 35 66 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_10 TEXT 213 12 66 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_11 TEXT 212 127 66 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_22 TEXT 212 106 66 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_23 TEXT 212 83 66 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_24 TEXT 295 84 66 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_25 TEXT 295 107 66 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_26 TEXT 295 128 66 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_27 TEXT 296 13 66 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_28 TEXT 296 36 66 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_29 TEXT 296 57 66 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_DROPLIST_0 DROPLIST 14 34 126 22
          END
          WID_BUTTON_15 PUSHBUTTON 15 63 122 25
          VALUE "Refine"
          ALIGNCENTER
          END
          WID_LABEL_2 LABEL 14 12 0 0
          VALUE "Crystal system"
          ALIGNLEFT
          END
          WID_BASE_8 BASE 9 218 0 0
          COLUMNS = 1
          NONEXCLUSIVE
          CAPTION "IDL"
          BEGIN
            WID_BUTTON_22 PUSHBUTTON -1 -1 0 0
            VALUE "Save fitting results"
            ALIGNLEFT
            END
          END
          WID_DROPLIST_1 DROPLIST 281 189 0 0
          END
          WID_LABEL_7 LABEL 186 193 0 0
          VALUE "Manual adjust"
          ALIGNLEFT
          END
          WID_TEXT_39 TEXT 282 217 85 21
          EDITABLE
          WIDTH = 20
          HEIGHT = 1
          END
          WID_BUTTON_92 PUSHBUTTON 184 215 18 22
          VALUE "<"
          ALIGNCENTER
          END
          WID_TEXT_40 TEXT 207 216 37 21
          EDITABLE
          WIDTH = 20
          HEIGHT = 1
          END
          WID_BUTTON_101 PUSHBUTTON 248 215 18 22
          VALUE ">"
          ALIGNCENTER
          END
          WID_BASE_22 BASE 26 166 0 0
          COLUMNS = 1
          NONEXCLUSIVE
          CAPTION "IDL"
          BEGIN
            WID_BUTTON_88 PUSHBUTTON -1 -1 0 0
            VALUE "Apply to all phases"
            ALIGNLEFT
            END
          END
          WID_TEXT_30 TEXT 29 125 37 21
          EDITABLE
          WIDTH = 20
          HEIGHT = 1
          END
          WID_BUTTON_50 PUSHBUTTON 70 124 18 22
          VALUE ">"
          ALIGNCENTER
          END
          WID_BUTTON_49 PUSHBUTTON 6 124 18 22
          VALUE "<"
          ALIGNCENTER
          END
          WID_LABEL_12 LABEL 105 106 0 0
          VALUE "Pressure [GPa]"
          ALIGNLEFT
          END
          WID_TEXT_0 TEXT 104 126 85 21
          EDITABLE
          WIDTH = 20
          HEIGHT = 1
          END
          WID_TEXT_44 TEXT 212 154 66 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_LABEL_16 LABEL 192 158 0 0
          VALUE "V"
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
          VALUE "Generate"
          ALIGNCENTER
          END
          WID_BUTTON_52 PUSHBUTTON 8 158 94 37
          VALUE "Subtract"
          ALIGNCENTER
          END
          WID_BUTTON_70 PUSHBUTTON 8 196 94 37
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
          WID_BUTTON_41 PUSHBUTTON 368 66 29 22
          VALUE "X"
          ALIGNCENTER
          END
          WID_LABEL_5 LABEL 238 70 0 0
          VALUE "Spline nodes"
          ALIGNLEFT
          END
          WID_TEXT_37 TEXT 213 152 43 21
          WIDTH = 20
          HEIGHT = 1
          END
          WID_BUTTON_79 PUSHBUTTON 213 125 43 24
          VALUE "+"
          ALIGNCENTER
          END
          WID_BUTTON_80 PUSHBUTTON 213 176 43 24
          VALUE "-"
          ALIGNCENTER
          END
          WID_BUTTON_63 PUSHBUTTON 8 114 94 37
          VALUE "Refine"
          ALIGNCENTER
          END
          WID_BASE_0 BASE 113 210 0 0
          COLUMNS = 1
          NONEXCLUSIVE
          CAPTION "IDL"
          BEGIN
            WID_BUTTON_5 PUSHBUTTON -1 -1 0 0
            VALUE "Show all nodes"
            ALIGNLEFT
            END
          END
          WID_BASE_16 BASE 347 31 0 0
          COLUMNS = 1
          NONEXCLUSIVE
          CAPTION "IDL"
          BEGIN
            WID_BUTTON_64 PUSHBUTTON -1 -1 0 0
            VALUE ""
            ALIGNLEFT
            END
          END
          WID_BUTTON_83 PUSHBUTTON 104 158 94 37
          VALUE "Undo"
          ALIGNCENTER
          END
          WID_BUTTON_90 PUSHBUTTON 104 77 94 37
          VALUE "MCA"
          ALIGNCENTER
          END
        END
        WID_BASE_10 BASE 0 0 408 248
        XPAD = 3
        YPAD = 3
        SPACE = 3
        CAPTION "Output"
        BEGIN
          WID_BUTTON_8 PUSHBUTTON 13 20 74 33
          VALUE "Save graph"
          ALIGNCENTER
          END
          WID_BUTTON_11 PUSHBUTTON 14 55 73 32
          VALUE "Print graph"
          ALIGNCENTER
          END
          WID_BASE_14 BASE 124 20 0 0
          COLUMNS = 1
          EXCLUSIVE
          CAPTION "IDL"
          BEGIN
            WID_BUTTON_9 PUSHBUTTON -1 -1 0 0
            VALUE "Small window"
            ALIGNLEFT
            END
            WID_BUTTON_10 PUSHBUTTON -1 -1 0 0
            VALUE "Large window"
            ALIGNLEFT
            END
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
          WID_BUTTON_40 PUSHBUTTON 132 183 59 35
          VALUE "Add"
          ALIGNCENTER
          END
          WID_BUTTON_86 PUSHBUTTON 193 183 59 35
          VALUE "Subtract"
          ALIGNCENTER
          END
          WID_BUTTON_87 PUSHBUTTON 11 97 90 25
          VALUE "Swap w/ princ."
          ALIGNCENTER
          END
        END
      END
    END
  END
  WID_BUTTON_1 PUSHBUTTON 794 728 194 34
  VALUE "Close"
  ALIGNCENTER
  END
  WID_LIST_10 LIST 794 326 194 189
  WIDTH = 11
  HEIGHT = 2
  END
  WID_TEXT_5 TEXT 793 55 63 21
  WIDTH = 20
  HEIGHT = 1
  END
  WID_TEXT_6 TEXT 857 55 65 21
  WIDTH = 20
  HEIGHT = 1
  END
  WID_LABEL_1 LABEL 817 38 0 0
  VALUE "2th"
  ALIGNLEFT
  END
  WID_LABEL_3 LABEL 889 38 0 0
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
  WID_LIST_12 LIST 795 112 194 188
  WIDTH = 11
  HEIGHT = 2
  END
  WID_TEXT_35 TEXT 924 55 63 21
  WIDTH = 20
  HEIGHT = 1
  END
  WID_LABEL_6 LABEL 946 39 0 0
  VALUE "Q"
  ALIGNLEFT
  END
END

LCDC_REG   EQU $FF40   ; LCD制御レジスタ
STAT_REG   EQU $FF41   ; LCDステータスレジスタ
SCY_REG    EQU $FF42   ; スクロールY位置
SCX_REG    EQU $FF43   ; スクロールX位置
LYC_REG    EQU $FF45   ; スキャンライン比較値
WY_REG     EQU $FF4A   ; ウィンドウY位置
WX_REG     EQU $FF4B   ; ウィンドウX位置
BGP_REG    EQU $FF47   ; 背景パレットデータ

InitLCD:
    LD A, 0
    LD (LCDC_REG), A
    LD A, $E4
    LD (BGP_REG), A
    LD A, 0
    LD (SCY_REG), A
    LD (SCX_REG), A
    LD A, $80
    LD (LCDC_REG), A
    LD HL, $9800
    LD DE, $00
    LD BC, $0400

DrawBlackScreen:
    LD (HL), 0
    INC HL
    DEC BC
    JP NZ, DrawBlackScreen
    JP DrawBlackScreen

import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    title: qsTr("#Gauge")
    width: 640
    height: 480
    visible: true

    property real _Main_To_Size: 1.1
    property color appWindowBackground_Color: "black"

    //!Main_module:START
    property color mainModuleBackgroundColor: "#0000ffff"
    //!Main_module:END


    //!Speed_Box Speed_Box_Item:START
    property color spdBox_CanvasMain_BorderColor: "red" //"#FF3D00"     //Speed_Box:Circle border color
    property color spdBox_CanvasMain_FillColor: "black"         //Speed_Box:Circle background color
    property real spdBox_CanvasMain_BorderLine_Width: 2


    property int spdBox_Item_DefaultWidth: 30*_Main_To_Size
    property int spdBox_Item_DefaultHeight: 30*_Main_To_Size
    property real spdBox_Item_Activate_Scale: 1.1
    property real spdBox_Item_Activate_Scale_Default: 1


    property color spdBox_Item_borderColor_Default: "#FF3D00"
    property color spdBox_Item_borderColor_Active: "red"
    property color spdBox_Item_BackgroundColor: "black"

    property var spdBox_Item_FontFamily: "Helvectia"
    property int spdBox_Item_FontSize: 12
    property bool spdBox_Item_fontBold: true
    property color spdBox_Item_fontColor: "#FF3D00"
    //!Speed_Box Speed_Box_Item:END


    //!Main_module:START
    property color mainModule_SpeedBar_BackgroundColor: "#0000ffff" //CircularGauge background color
    //!Main_module:END


    //!Custom_CircularGauge:START
    property color circularGauge_CenterPoint_Color: "black "//"#6295AB"       //POINT in center: background,curSpeed background
    property color circularGauge_CenterPoint_BorderColor: "#FF3D00" //"#D1B000"
    property real circularGauge_CenterPoint_BorderWidth: 1

    property real circularGauge_CanvasBorder_LineWidth: 0.02        //Canvas GradientLine width
    property int circularGauge_MinorTickMarkCount: 4                //4 default


    property int circularGauge_Speed_FontSize: 50
    property bool circularGauge_Speed_fontBold: true
    property color circularGauge_Speed_fontColor: "white"

    property color circularGauge_TickMarkLabel_TextColor: "white"

    property string circularGauge_NeedleSource: "/myRec/needle1_1.png"
    //!Custom_CircularGauge:END


    //!Bar_Fuel:START
    property color canvas_FuelIndicator_Color: "red" //"#FF3D00"
    //!Bar_Fuel:END

    //!Bar_Fuel_Above:START
    property color canvas_StrokeStyle_Color: "#FF2C00"
    //!Bar_Fuel_Above:END

    color:appWindowBackground_Color
    property string appWindowBackground_Image: ""

    Image {
        id: appBackGroundImage

        width: parent.width
        height: parent.height

        source: appWindowBackground_Image
    }

    Main_module{
        id:i_main_module
        anchors.centerIn: parent
    }

    signal main_Update_AllCanvas()
    onMain_Update_AllCanvas: i_main_module.reqRePaint_1()

    NavPanel{
        id:i_NavPanel
    }

    Image {

        anchors.top: parent.top
        source: "/myRec/declarative-qtlogo.png"

    }

}

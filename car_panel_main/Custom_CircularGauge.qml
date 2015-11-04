import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

import "qrc:/JScripts/Main_Script.js" as MainScript



CircularGauge {

    function reqRePaint_2(){
        i_speed_box.reqRePaint_SpeedBox();

        i_Fuel_Bar_Canvas.reqRePaint_FuelBar();
        i_canvas_circle_above.requestPaint();
    }

    id:i_CircularGauge
    value: accelerating ? max_Gauge_Value : min_Gauge_Value
    anchors.centerIn: parent
    implicitHeight: m_speedBar.height
    implicitWidth: m_speedBar.width

    property bool accelerating: false

    readonly property int _curSpdVal: 0


    property int _curSpdVal_Iter: 0
    property int _curSpdVal_Amount : 0
    property int duration_Gauge_Value: 2000
    property real  max_Gauge_Value: 9.0
    property real min_Gauge_Value: 0.0
    property real speed_X_Multiplication: 30

    property bool is_Push: false

    signal curSpeed_Activated(var numOfSpeed)
    onCurSpeed_Activated: i_speed_box.set_Cur_SpeedBox_Value(numOfSpeed)

    signal spaceAccelerating_Push()
    onSpaceAccelerating_Push: i_Fuel_Bar_Canvas.fuelBarTimer_Start()
    signal spaceAccelerating_Release()
    onSpaceAccelerating_Release: i_Fuel_Bar_Canvas.fuelBarTimer_Stop()

    property bool gameWithSpeed: false
    property int duration_TimerElapsed: 85
    property bool isTimerNoStart: false


//    Keys.onUpPressed:  {
//        if(event.isAutoRepeat) return;

//    }

    Keys.onSpacePressed:{

//                if(event.isAutoRepeat) return;
                if(event.modifiers && Qt.ControlModifier){

                    duration_TimerElapsed= 85;
                    gameWithSpeed = true;

                    accelerating = true;
                    is_Push = true;
                    spaceAccelerating_Push();

                }else
                {
                    duration_TimerElapsed= 85;
                    gameWithSpeed = false;


                    accelerating = true;
                    is_Push = true;
                    spaceAccelerating_Push();

                }

    }

    Keys.onReleased: {


        if (event.key === Qt.Key_Space) {

            if (gameWithSpeed) {duration_TimerElapsed = 85;}
            else { duration_TimerElapsed = 30;}

            accelerating = false;
            is_Push = false;
            event.accepted = true;
            spaceAccelerating_Release();
        }
    }

    Component.onCompleted: forceActiveFocus()

    Behavior on value {
        NumberAnimation {
            duration: duration_Gauge_Value
        }
    }

    minimumValue: 0
    maximumValue: 9

//            stepSize: 0.1


    style: CircularGaugeStyle{

        id: style

        maximumValueAngle: 90
        minimumValueAngle: -180
        labelStepSize : 1



        function degreesToRadians(degrees) {
            return degrees * (Math.PI / 180);
        }
        background: Canvas {
            onPaint: {
                var ctx = getContext("2d");
                ctx.reset();

                ctx.beginPath();

                var grd=ctx.createLinearGradient(0,300,0,0);
                grd.addColorStop(0,"#F4F6FE");
                grd.addColorStop(0.2,"#A0B7F6");
                grd.addColorStop(0.7,"#3064F3");
                grd.addColorStop(1,"#0444F1");

                ctx.strokeStyle = grd;/*"#D1B000"*/
                ctx.lineWidth = outerRadius * circularGauge_CanvasBorder_LineWidth;

                ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                    degreesToRadians(90), degreesToRadians(300));
                ctx.stroke();

                ctx.beginPath();



                ctx.strokeStyle = "red";/*"#D1B000"*/
                ctx.lineWidth = outerRadius * circularGauge_CanvasBorder_LineWidth;

                ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                    degreesToRadians(300), degreesToRadians(360));
                ctx.stroke();

            }
        }

        //NEEDLE(игла)
        needle: Image {
            width:32
            height:131
            id: needle_image
            fillMode: Image.PreserveAspectFit
            source: circularGauge_NeedleSource
            antialiasing: true
        }

        //POINT in center
        foreground: Item {
            Rectangle {
                width: (outerRadius * 1.3)
                height: width
                radius: (width/2)
                color: circularGauge_CenterPoint_Color
                anchors.centerIn: parent

                border.color: circularGauge_CenterPoint_BorderColor
                border.width: circularGauge_CenterPoint_BorderWidth

                Rectangle
                {

                    id:_speedomentr_Rect
                    anchors.centerIn: parent
                    implicitWidth: 80*_Main_To_Size
                    implicitHeight: 50*_Main_To_Size

                    color: circularGauge_CenterPoint_Color

                    Timer {
                        id:m_TimerElapsed
                        interval: duration_TimerElapsed
                        running: true
                        repeat: true
                        onTriggered: MainScript.speed_IterValueTo(1)
                    }

                        Text
                        {
                            readonly property int _curSpdVal: i_CircularGauge.value //control.value

                            id: _curSpeed_Block

                            anchors.centerIn: parent



                            font.family: spdBox_Item_FontFamily
                            font.pointSize: circularGauge_Speed_FontSize
                            font.bold: circularGauge_Speed_fontBold
                            color:circularGauge_Speed_fontColor


                            maximumLineCount: 20

                            text:_curSpdVal_Amount  /*MainScript.speed_IterValueTo(0)*/ /*_curSpdVal*speed_X_Multiplication*/
//                            text:"001"

                            on_CurSpdValChanged:MainScript.switch_SpeedBox_Value(_curSpdVal)/* _compute_CurSpeed_Pos(_curSpdVal)*/

                        }
                    }

                    Text
                    {

                        anchors.horizontalCenter: _speedomentr_Rect.horizontalCenter
                        anchors.top: _speedomentr_Rect.bottom


                        font.family: "TypeWriter"
                        font.pointSize: 14
                        font.bold: true
                        color: "red"

                        text:qsTr("km/h")
                    }

                    }
                }


        tickmarkLabel:  Text {

            font.family: "Helvetica"
//            font.pointSize: 14

            font.pixelSize: Math.max(20, outerRadius * 0.1)
            text: styleData.value
            color: circularGauge_TickMarkLabel_TextColor
            antialiasing: true
        }


        tickmarkStepSize : 1
        tickmark: Rectangle {


            visible: styleData.value < 7 || styleData.value % 1 == 0
            implicitWidth: (outerRadius * 0.03)
            antialiasing: true
            implicitHeight: (outerRadius * 0.1)
            color: MainScript.tickMarkColor(styleData.value)

//            color:styleData.value >= 7 ? "#EB0000" : "#e5e5e5"


        }


        minorTickmarkCount: circularGauge_MinorTickMarkCount
        minorTickmark: Rectangle {
            visible: styleData.value

            implicitWidth: (outerRadius * 0.01)
            antialiasing: true
            implicitHeight: (outerRadius * 0.03)
            color: styleData.value >= 7 ? "#EB0000" :"#000"

        }

    }//CircularGaugeStyle


//    //=========================================================//
//    NavPanel{

//    }
//    //=========================================================//

    //=========================================================//

    Speed_Box{
        id:i_speed_box
    }//Speed_Box

    //=========================================================//

    Rectangle{
        id:i_FuelGauge_Rect

        width: 300*_Main_To_Size
        height: 300*_Main_To_Size

        anchors.centerIn: parent

//        border.color: "red"
//        border.width: 1

        color: "#0000ffff"

        Bar_Fuel{
            id: i_Fuel_Bar_Canvas

        }//Bar_Fuel

        Bar_Fuel_Above{
            id:i_canvas_circle_above

        }//Bar_Fuel_Above

    }//Bar_Fuel_RECT

    //=========================================================//

}//CircularGauge


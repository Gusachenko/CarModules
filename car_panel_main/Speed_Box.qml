import QtQuick 2.0

import "qrc:/JScripts/Main_Script.js" as MainScript

Rectangle {

    id:i_speed_box

    function update_BoxItem_BorderColor(){
        box_Item_0.border.color=spdBox_Item_borderColor_Default;
        box_Item_1.border.color=spdBox_Item_borderColor_Default;
        box_Item_2.border.color=spdBox_Item_borderColor_Default;
        box_Item_3.border.color=spdBox_Item_borderColor_Default;
        box_Item_4.border.color=spdBox_Item_borderColor_Default;
        box_Item_5.border.color=spdBox_Item_borderColor_Default;

        box_Item_0.scale = spdBox_Item_Activate_Scale_Default;
        box_Item_1.scale = spdBox_Item_Activate_Scale_Default;
        box_Item_2.scale = spdBox_Item_Activate_Scale_Default;
        box_Item_3.scale = spdBox_Item_Activate_Scale_Default;
        box_Item_4.scale = spdBox_Item_Activate_Scale_Default;
        box_Item_5.scale = spdBox_Item_Activate_Scale_Default;
    }

    function set_Cur_SpeedBox_Value(value){
        update_BoxItem_BorderColor();
        switch(value){
        case 0:
            box_Item_0.border.color=spdBox_Item_borderColor_Active;
            box_Item_0.scale = spdBox_Item_Activate_Scale;
            canvasText_Center.text="N";
            break
        case 1:
            box_Item_1.border.color=spdBox_Item_borderColor_Active;
            box_Item_1.scale = spdBox_Item_Activate_Scale;
            canvasText_Center.text="1";
            break
        case 2:
            box_Item_2.border.color=spdBox_Item_borderColor_Active;
            box_Item_2.scale = spdBox_Item_Activate_Scale;
            canvasText_Center.text="2";
            break
        case 3:
            box_Item_3.border.color=spdBox_Item_borderColor_Active;
            box_Item_3.scale = spdBox_Item_Activate_Scale;
            canvasText_Center.text="3";
            break
        case 4:
            box_Item_4.border.color=spdBox_Item_borderColor_Active;
            box_Item_4.scale = spdBox_Item_Activate_Scale;
            canvasText_Center.text="4";
            break
        case 5:
            box_Item_5.border.color=spdBox_Item_borderColor_Active;
            box_Item_5.scale = spdBox_Item_Activate_Scale;
            canvasText_Center.text="5";
            break
        }

    }

    property int cur_SpeedBox_Value: 0

    function reqRePaint_SpeedBox(){
        canvas_SpdBox.requestPaint();
        update_BoxItem_BorderColor();
        set_Cur_SpeedBox_Value(_curSpdVal_Iter);
    }

    anchors.top: parent.top
    anchors.left: parent.left

    anchors.topMargin: (parent.height*0.51)*_Main_To_Size
    anchors.leftMargin: (parent.width*0.54)*_Main_To_Size

    width: 120*_Main_To_Size
    height: 120*_Main_To_Size

    color: "#0000ffff" //transparent

    function addItemTo(_pos,radius){

    var _coordinates={
         x:0.0,
         y:0.0
        }

        var x1,y1
        var x0=canvas_SpdBox.width/2-box_Item_0.width/2;
        var y0=canvas_SpdBox.height/2-box_Item_0.height/2;
        var _angle;


        // Converts from degrees to radians.
        Math.radians = function(degrees) {
          return degrees * Math.PI / 180;
        };

        function  get_Coordinates(degrees){
            _coordinates.x = x0 + (Math.cos(degrees) * radius);
            _coordinates.y = y0 + (Math.sin(degrees) * radius);
        };

        switch(_pos){
        case 0:
            _angle=Math.radians(90); //! Inverted circle
            get_Coordinates(_angle);
            break
        case 1:
            _angle=Math.radians(135);
            get_Coordinates(_angle);
            break
        case 2:
            _angle=Math.radians(180);
            get_Coordinates(_angle);
            break
        case 3:
            _angle=Math.radians(225);
            get_Coordinates(_angle);
            break
        case 4:
            _angle=Math.radians(270);
            get_Coordinates(_angle);
            break
        case 5:
            _angle=Math.radians(315);
            get_Coordinates(_angle);
            break
        default:
            break

        }

        return _coordinates
    }




    Canvas{
        id: canvas_SpdBox

        width: (parent.width*0.8)*_Main_To_Size
        height: (parent.height*0.8)*_Main_To_Size
        antialiasing: true
        anchors.centerIn: parent

        property real centerWidth: width / 2
        property real centerHeight: height / 2
        property real radius: Math.min(canvas_SpdBox.width, canvas_SpdBox.height) / 2-2


        // this is the angle that splits the circle in two arcs
        // first arc is drawn from 0 radians to angle radians
        // second arc is angle radians to 2*PI radians
        property real angle: /*(currentValue - minimumValue) / (maximumValue - minimumValue)*/
                             180 * 2 * Math.PI

        // we want both circle to start / end at 12 o'clock
        // without this offset we would start / end at 9 o'clock
        property real angleOffset: -Math.PI / 2


        onPaint: {

            var ctx = getContext("2d");
            ctx.save();

            ctx.clearRect(0, 0, canvas_SpdBox.width, canvas_SpdBox.height);
            ctx.beginPath();
            ctx.lineWidth = spdBox_CanvasMain_BorderLine_Width;
            ctx.strokeStyle = spdBox_CanvasMain_BorderColor;
            ctx.arc(canvas_SpdBox.centerWidth,
            canvas_SpdBox.centerHeight,
            canvas_SpdBox.radius,
            angleOffset + canvas_SpdBox.angle,
            angleOffset + 2*Math.PI);

            ctx.fillStyle=spdBox_CanvasMain_FillColor;
            ctx.fill();

            ctx.stroke();

        }//OnPaint

        Text {

            id: canvasText_Center

            anchors.centerIn: parent
            text: qsTr("N")
            color: circularGauge_Speed_fontColor

            font {
                family: spdBox_Item_FontFamily;
                pointSize: 35;
                bold: spdBox_Item_fontBold;
            }

        }



        Speed_Box_Item{
            id:box_Item_0
            property var _ItemPos: addItemTo(0,canvas_SpdBox.radius)

            x:_ItemPos.x
            y:_ItemPos.y

            scale: spdBox_Item_Activate_Scale
            border.color: spdBox_Item_borderColor_Active
            color: spdBox_Item_BackgroundColor
            Text {

                anchors.centerIn: parent

                font {
                    family: spdBox_Item_FontFamily;
                    pointSize: spdBox_Item_FontSize;
                    bold: spdBox_Item_fontBold;
                }
                color: spdBox_Item_fontColor
                text: qsTr("N")
            }
        }

        Speed_Box_Item{
            id:box_Item_1
            property var _ItemPos: addItemTo(1,canvas_SpdBox.radius)

            x:_ItemPos.x
            y:_ItemPos.y

            color: spdBox_Item_BackgroundColor

            Text {
                anchors.centerIn: parent


//                font.family: "TypeWriter"
//                font.pointSize: 12
//                font.bold: true

                font {
                    family: spdBox_Item_FontFamily;
                    pointSize: spdBox_Item_FontSize;
                    bold: spdBox_Item_fontBold;
                }
                color: spdBox_Item_fontColor
                text: qsTr("1")
            }
        }

        Speed_Box_Item{
            id:box_Item_2
            property var _ItemPos: addItemTo(2,canvas_SpdBox.radius)

            x:_ItemPos.x
            y:_ItemPos.y

            color: spdBox_Item_BackgroundColor

            Text {
                anchors.centerIn: parent

                font {
                    family: spdBox_Item_FontFamily;
                    pointSize: spdBox_Item_FontSize;
                    bold: spdBox_Item_fontBold;
                }
                color: spdBox_Item_fontColor
                text: qsTr("2")
            }
        }

        Speed_Box_Item{
            id:box_Item_3
            property var _ItemPos: addItemTo(3,canvas_SpdBox.radius)

            x:_ItemPos.x
            y:_ItemPos.y

            color: spdBox_Item_BackgroundColor

            Text {
                anchors.centerIn: parent

                font {
                    family: spdBox_Item_FontFamily;
                    pointSize: spdBox_Item_FontSize;
                    bold: spdBox_Item_fontBold;
                }
                color: spdBox_Item_fontColor
                text: qsTr("3")
            }
        }

        Speed_Box_Item{
            id:box_Item_4
            property var _ItemPos: addItemTo(4,canvas_SpdBox.radius)

            x:_ItemPos.x
            y:_ItemPos.y

            color: spdBox_Item_BackgroundColor

            Text {
                anchors.centerIn: parent

                font {
                    family: spdBox_Item_FontFamily;
                    pointSize: spdBox_Item_FontSize;
                    bold: spdBox_Item_fontBold;
                }
                color: spdBox_Item_fontColor
                text: qsTr("4")
            }
        }

        Speed_Box_Item{
            id:box_Item_5
            property var _ItemPos: addItemTo(5,canvas_SpdBox.radius)

            x:_ItemPos.x
            y:_ItemPos.y

            color: spdBox_Item_BackgroundColor

            Text {
                anchors.centerIn: parent

                font {
                    family: spdBox_Item_FontFamily;
                    pointSize: spdBox_Item_FontSize;
                    bold: spdBox_Item_fontBold;
                }
                color: spdBox_Item_fontColor
                text: qsTr("5")
            }
        }

    }//Canvas
}


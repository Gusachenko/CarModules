import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import QtGraphicalEffects 1.0

Rectangle {
    id:i_NavPanel



    function style_AllToBlack(){
        appWindowBackground_Color="black";

        spdBox_CanvasMain_BorderColor="red";
        spdBox_CanvasMain_FillColor="black";
        spdBox_Item_borderColor_Default="#FF3D00";
        spdBox_Item_borderColor_Active="red";
        spdBox_Item_BackgroundColor="black";
        spdBox_Item_FontFamily="Helvectia";
        spdBox_Item_fontColor="#FF3D00";

        circularGauge_CenterPoint_Color="black";
        circularGauge_CenterPoint_BorderColor="#FF3D00";
        circularGauge_Speed_fontColor="white";
        circularGauge_TickMarkLabel_TextColor="white";
        circularGauge_NeedleSource="/myRec/needle1_1.png";

        canvas_FuelIndicator_Color="red";
        canvas_StrokeStyle_Color="#FF2C00";

        appWindowBackground_Image="";

        main_Update_AllCanvas();
    }

    function style_AllToWhite(){
        appWindowBackground_Color="white";

        spdBox_CanvasMain_BorderColor="black";
        spdBox_CanvasMain_FillColor="white";
        spdBox_Item_borderColor_Default="black";
        spdBox_Item_borderColor_Active="#3064F3";
        spdBox_Item_BackgroundColor="white";
        spdBox_Item_FontFamily="Helvectia";
        spdBox_Item_fontColor="black";

        circularGauge_CenterPoint_Color="white";
        circularGauge_CenterPoint_BorderColor="black";
        circularGauge_Speed_fontColor="black";
        circularGauge_TickMarkLabel_TextColor="black";
        circularGauge_NeedleSource="/myRec/needle1_2.png";

        canvas_FuelIndicator_Color="#3064F3";
        canvas_StrokeStyle_Color="#0444F1";

        appWindowBackground_Image="";

        main_Update_AllCanvas();
    }


    function imgStyle_1(){
        appWindowBackground_Image="/myRec/black_1_2.jpg"
        main_Update_AllCanvas();

    }
    function imgStyle_2(){

        appWindowBackground_Image="/myRec/white_2_4.png"
        main_Update_AllCanvas();
    }
    function imgStyle_3(){

        appWindowBackground_Image="/myRec/custom_1_1.png"
        main_Update_AllCanvas();
    }



    anchors.right: parent.right
    anchors.top: parent.top

    anchors.rightMargin: parent.width*0.01
    anchors.topMargin: parent.height*0.01

    width: 150
    height: 90

    border.color: "grey"
    border.width: 1

    radius: 3

    color: "white"

    Column{
        anchors.centerIn: parent
        spacing: 1
        Row{
            spacing: 1
            Button {text: "White";width: 70; height: 40
                style: ButtonStyle {
                        background: Rectangle {
                            border.width: control.activeFocus ? 2 : 1
                            border.color: "#888"
                            radius: 0
                            gradient: Gradient {
                                GradientStop { position: 0.0 ; color: control.pressed ?  "#74CE06" :"#0000ffff"  }
                                GradientStop { position: 0.1 ; color: "#0000ffff"  }

                                GradientStop { position: 0.5 ; color: control.pressed ? "#0000ffff" :"#0000ffff"  }

                                GradientStop { position: 0.9 ; color: "#0000ffff"  }
                                GradientStop { position: 1.0 ; color: control.pressed ?  "#74CE06": "#0000ffff"}
                            }
                        }
                    }
                onClicked: style_AllToWhite()

            }
            Button {text: "Black";width: 70; height: 40
                style: ButtonStyle {
                        background: Rectangle {
                            border.width: control.activeFocus ? 2 : 1
                            border.color: "#888"
                            radius: 0
                            gradient: Gradient {
                                GradientStop { position: 0.0 ; color: control.pressed ?  "#74CE06" :"#0000ffff"  }
                                GradientStop { position: 0.1 ; color: "#0000ffff"  }

                                GradientStop { position: 0.5 ; color: control.pressed ? "#0000ffff" :"#0000ffff"  }

                                GradientStop { position: 0.9 ; color: "#0000ffff"  }
                                GradientStop { position: 1.0 ; color: control.pressed ?  "#74CE06": "#0000ffff"}
                            }
                        }
                    }
                onClicked: style_AllToBlack()
            }
        }
        Row{
            spacing: 1
            Button {text: "1";width: 45; height: 40
                style: ButtonStyle {
                        background: Rectangle {
                            border.width: control.activeFocus ? 2 : 1
                            border.color: "#888"
                            radius: 0
                            gradient: Gradient {
                                GradientStop { position: 0.0 ; color: control.pressed ?  "#74CE06" :"#0000ffff"  }
                                GradientStop { position: 0.1 ; color: "#0000ffff"  }

                                GradientStop { position: 0.5 ; color: control.pressed ? "#0000ffff" :"#0000ffff"  }

                                GradientStop { position: 0.9 ; color: "#0000ffff"  }
                                GradientStop { position: 1.0 ; color: control.pressed ?  "#74CE06": "#0000ffff"}
                            }
                        }
                    }
                onClicked: imgStyle_1()
            }
            Button {text: "2";width: 45; height: 40
                style: ButtonStyle {
                        background: Rectangle {
                            border.width: control.activeFocus ? 2 : 1
                            border.color: "#888"
                            radius: 0
                            gradient: Gradient {
                                GradientStop { position: 0.0 ; color: control.pressed ?  "#74CE06" :"#0000ffff"  }
                                GradientStop { position: 0.1 ; color: "#0000ffff"  }

                                GradientStop { position: 0.5 ; color: control.pressed ? "#0000ffff" :"#0000ffff"  }

                                GradientStop { position: 0.9 ; color: "#0000ffff"  }
                                GradientStop { position: 1.0 ; color: control.pressed ?  "#74CE06": "#0000ffff"}
                            }
                        }
                    }
                onClicked: imgStyle_2()
            }
            Button {text: "3";width: 49; height: 40
                style: ButtonStyle {
                        background: Rectangle {
                            border.width: control.activeFocus ? 2 : 1
                            border.color: "#888"
                            radius: 0
                            gradient: Gradient {
                                GradientStop { position: 0.0 ; color: control.pressed ?  "#74CE06" :"#0000ffff"  }
                                GradientStop { position: 0.1 ; color: "#0000ffff"  }

                                GradientStop { position: 0.5 ; color: control.pressed ? "#0000ffff" :"#0000ffff"  }

                                GradientStop { position: 0.9 ; color: "#0000ffff"  }
                                GradientStop { position: 1.0 ; color: control.pressed ?  "#74CE06": "#0000ffff"}
                            }
                        }
                    }
                onClicked: imgStyle_3()
                }
        }

    }

}


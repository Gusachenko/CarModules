import QtQuick 2.0

Rectangle {

    id:i_main_module

    width: 325*_Main_To_Size
    height: 325*_Main_To_Size
    color:mainModuleBackgroundColor                           //main module background color


    function reqRePaint_1(){
        i_CircularGauge.reqRePaint_2();
    }

    Rectangle{

        id:m_speedBar

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 40
        anchors.leftMargin: 40


        width: 250*_Main_To_Size
        height: 250*_Main_To_Size
        color:mainModule_SpeedBar_BackgroundColor


        radius: width/2

        Custom_CircularGauge{
            id:i_CircularGauge

        }//Custom_CircularGauge

    }//Rectangle m_speedBar


}


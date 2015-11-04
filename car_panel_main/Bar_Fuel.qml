import QtQuick 2.0

Canvas {
    id: i_Fuel_Bar_Canvas
    antialiasing: true

    width: parent.width
    height: parent.height


    anchors.centerIn: parent


    property real speedBar_Radius: m_speedBar.width/2*m_xScale


    property real fuel_GaugeRect_Width: i_FuelGauge_Rect.width*m_xScale
    property real fuel_GaugeRect_Height: i_FuelGauge_Rect.height*m_xScale

    property real fuel_GaugeRect_Radius: i_FuelGauge_Rect.radius*m_xScale

    property real fuel_GaugeRect_Center_X: i_FuelGauge_Rect.width/2
    property real fuel_GaugeRect_Center_Y: i_FuelGauge_Rect.height/2

    property real m_xScale: 1.16
    ///

    property real curProcess_Value: 360
    property int proc_LineWidth: speedBar_Radius*0.1*_Main_To_Size

    property color m_stroke_Color: canvas_FuelIndicator_Color       // "#0000ffff"*  transparent

    ////
    property bool is_ProcessFill: false
    property real standAlone_Process: 360
    onStandAlone_ProcessChanged:  requestPaint()

    function reqRePaint_FuelBar(){
        requestPaint();
        toggle();
    }

    function toggle() {

        if(standAlone_Process==90 || is_ProcessFill){
            standAlone_Process=standAlone_Process+0.01;
            if(standAlone_Process==360) is_ProcessFill=false;
            m_stroke_Color="green"
        }
        if(standAlone_Process==360 || !is_ProcessFill){
            standAlone_Process=standAlone_Process-0.01;
            if (standAlone_Process==90) is_ProcessFill=true;
            m_stroke_Color=canvas_FuelIndicator_Color
        }

        n_anim_Circle.start();

    }

    function fuelBarTimer_Start(){
        fuelBar_Timer.start();
    }
    function fuelBarTimer_Stop(){
        fuelBar_Timer.stop();
    }


    NumberAnimation {
        id:n_anim_Circle
        target: i_Fuel_Bar_Canvas
        property: "curProcess_Value"
        easing.type: Easing.Linear
        to: standAlone_Process
        duration: 0
    }


    renderTarget: Canvas.FramebufferObject
    renderStrategy: Canvas.Cooperative

    onPaint: {

        var ctx = getContext("2d");

        ctx.clearRect(0, 0, width, height);

        ctx.resetTransform();

        ctx.fillStyle = '#0000ffff';
        ctx.fillRect(0, 0, width, height);

        ctx.beginPath();
        ctx.arc(fuel_GaugeRect_Center_X, fuel_GaugeRect_Center_Y, speedBar_Radius*0.94, 90 * Math.PI / 180, curProcess_Value * Math.PI / 180  );
        ctx.lineWidth = proc_LineWidth;
        ctx.strokeStyle = m_stroke_Color;
        ctx.stroke();

    }//onPaint

    Image {

                x:parent.width/2*0.9
                y:parent.height*0.924

                width:16
                height:18
                id: needle_image
                fillMode: Image.PreserveAspectFit
                source: "/myRec/rect3103.png"
                antialiasing: true
            }


    Timer {id:fuelBar_Timer;repeat: true;interval: 1;onTriggered: toggle();}


}//Canvas


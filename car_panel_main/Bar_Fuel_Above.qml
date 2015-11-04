import QtQuick 2.0

Canvas {

    id: i_canvas_circle_above

    property real m_xScale: 1.16

    property real speedBar_Radius: m_speedBar.width/2*m_xScale

    property real fuel_GaugeRect_Width: i_FuelGauge_Rect.width*m_xScale
    property real fuel_GaugeRect_Height: i_FuelGauge_Rect.height*m_xScale

    property real fuel_GaugeRect_Radius: i_FuelGauge_Rect.radius*m_xScale

    property real fuel_GaugeRect_Center_X: i_FuelGauge_Rect.width/2
    property real fuel_GaugeRect_Center_Y: i_FuelGauge_Rect.height/2

    width: parent.width
    height: parent.height

    anchors.centerIn: parent

    onPaint: {

        var ctx = getContext("2d");
        ctx.resetTransform();

        ctx.clearRect(0, 0, width, height);

        ctx.strokeStyle = canvas_StrokeStyle_Color;
        ctx.fillStyle = '#0000ffff';
        ctx.fillRect(0, 0, width, height);


        ctx.beginPath();
        ctx.arc(fuel_GaugeRect_Center_X, fuel_GaugeRect_Center_Y, speedBar_Radius, 90 * Math.PI / 180, 0);
        ctx.stroke();

        ctx.beginPath();
        ctx.moveTo(fuel_GaugeRect_Center_X, fuel_GaugeRect_Height*0.85);
        ctx.lineTo(fuel_GaugeRect_Center_X, fuel_GaugeRect_Height*0.7955);
        ctx.stroke();

        ctx.beginPath();
        ctx.arc(fuel_GaugeRect_Center_X, fuel_GaugeRect_Center_Y, speedBar_Radius*0.88, 90 * Math.PI / 180, 0);
        ctx.stroke();

        ctx.beginPath();
        ctx.moveTo(fuel_GaugeRect_Width*0.85, fuel_GaugeRect_Center_Y);
        ctx.lineTo(fuel_GaugeRect_Width*0.7955, fuel_GaugeRect_Center_Y);
        ctx.stroke();

    }

}


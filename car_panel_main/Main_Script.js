    function tickMarkColor(value){
                var color;
                switch(value){
                case 0:
                    color="#F4F6FE";
                    break
                case 1:
                case 2:
                    color="#A0B7F6";
                    break
                case 3:
                case 4:
                    color="#3064F3";
                    break
                case 5:
                case 6:
                    color="#0444F1";
                    break
                case 7:
                case 8:
                case 9:
                    color="#EB0000";
                    break
                default:
                    color="purple";
                    break;

                }

                return color;
            }


    function speed_IterValueTo(curSpdVal){

        if(is_Push && _curSpdVal_Amount<=260)
        {

            if(duration_TimerElapsed==85)
            {
                _curSpdVal_Amount=_curSpdVal_Amount+curSpdVal;
                isTimerNoStart=true;
            }else
            {
              _curSpdVal_Amount=_curSpdVal_Amount+curSpdVal;
            }
        }
        else
        {
            if(isTimerNoStart && _curSpdVal_Amount!=0){
                _curSpdVal_Amount=_curSpdVal_Amount-curSpdVal;
            }else isTimerNoStart=false;

        }

        return _curSpdVal_Amount
    }

    function switch_SpeedBox_Value(value){
            if (is_Push && _curSpdVal_Iter ===0){
                _compute_CurSpeed_Pos(1);
                _curSpdVal_Iter= _curSpdVal_Iter+1;
            }
            if (value===8 && is_Push){

                if (_curSpdVal_Iter<=4){

                    _curSpdVal_Iter= _curSpdVal_Iter+1;

                    min_Gauge_Value=5;
                    duration_Gauge_Value=0;
                    i_CircularGauge.accelerating=false;

                    _compute_CurSpeed_Pos(_curSpdVal_Iter/*_curSpdVal_Iter*speed_X_Multiplication*/);

                    duration_Gauge_Value=2000;
                    i_CircularGauge.accelerating=true;
                    min_Gauge_Value=0;
                }

            }
        if(!is_Push){

            myTestSpaceRelease(value);

            if (value===0 || value===2 || value===3 || value===4 || value===5){
                if(_curSpdVal_Iter!=0){

                _curSpdVal_Iter=_curSpdVal_Iter-1;

                _compute_CurSpeed_Pos(_curSpdVal_Iter/*_curSpdVal_Iter*speed_X_Multiplication*/);

                }


            }
        }//!isPush
    }

    function myTestSpaceRelease(value){

                    min_Gauge_Value=value;
                    max_Gauge_Value=value;
                    duration_Gauge_Value=0;
                    i_CircularGauge.accelerating=true;

                    duration_Gauge_Value=4000;
                    min_Gauge_Value=0;
                    max_Gauge_Value=9;
                    i_CircularGauge.accelerating=false;
                    duration_Gauge_Value=2000;
    }

    function _compute_CurSpeed_Pos(curSpdVal){

        switch(curSpdVal){
        case 0:
            curSpeed_Activated(0);
            break
        case 1:
            curSpeed_Activated(1);
            break
        case 2:
            curSpeed_Activated(2);
            break
        case 3:
            curSpeed_Activated(3);
            break
        case 4:
            curSpeed_Activated(4);
            break
        case 5:
            curSpeed_Activated(5);
            break
        }
    }

<?php

function observed_date($holiday){
    $day = date("w", strtotime($holiday));
    if($day == 6) {
        $observed_date = $holiday -1;
    } elseif ($day == 0) {
        $observed_date = $holiday +1;
    } else {
        $observed_date = $holiday;
    }
    return $observed_date;
}

function get_holiday($holiday_name) {

    $currentYear = date('Y');

    switch ($holiday_name) {
        // New Years Day
        case "new_year":
            $holiday = observed_date(date('Ymd', strtotime("first day of january $currentYear")));
            break;
        // Martin Luther King, Jr. Day
        case "mlk_day":
            $holiday = date('Ymd', strtotime("january $currentYear third monday"));
            break;
        // President's Day
        case "presidents_day":
            $holiday = date('Ymd', strtotime("february $currentYear third monday"));
            break;
        // Memorial Day
        case "memorial_day":
            $holiday = (new DateTime("Last monday of May"))->format("Ymd");
            break;
        // Independence Day
        case "independence_day":
            $holiday = observed_date(date('Ymd', strtotime("july 4 $currentYear")));
            break;
        // Labor Day
        case "labor_day":
            $holiday = date('Ymd', strtotime("september $currentYear first monday"));
            break;
        // Columbus Day
        case "columbus_day":
            $holiday = date('Ymd', strtotime("october $currentYear second monday"));
            break;
        // Veteran's Day
        case "veterans_day":
            $holiday = observed_date(date('Ymd', strtotime("november 11 $currentYear")));
            break;
        // Thanksgiving Day
        case "thanksgiving_day":
            $holiday = date('Ymd', strtotime("november $currentYear fourth thursday"));
            break;
        // Christmas Day
        case "christmas_day":
        $holiday = observed_date(date('Ymd', strtotime("december 25 $currentYear")));
            break;

        default:
            $holiday = "";
            break;
    }
    return $holiday;

}
  //function that checks if a holiday lands on saturday/sunday and so we can move them to a friday/monday respectively
    private function getObservedDate($holidayDate){

        $dayofweek = date("w", strtotime($holidayDate));

        if ($dayofweek == 6) $holidayDate = date('m/d/Y', strtotime("$holidayDate - 1 days")); //saturday moves to friday
        else if ($dayofweek == 0)  $holidayDate = date('m/d/Y', strtotime("$holidayDate + 1 days"));  //sunday moves monday

        return $holidayDate;
    }


    //function that calculates the holidays for any given year
    private function getFederalHolidaysForYear($year){

        $NY = $this->getObservedDate( date('m/d/Y', strtotime("1/1/$year")) ); //new years day

        $MLK = $this->getObservedDate( date('m/d/Y', strtotime("third monday of january $year")) );  //martin luther king day

        $PD = $this->getObservedDate( date('m/d/Y', strtotime("third monday of february $year")) ); ; //presidents day

        $MDay = $this->getObservedDate( date('m/d/Y', strtotime("last monday of May $year")) ); //memorial day  

        $IDay = $this->getObservedDate( date('m/d/Y', strtotime("7/4/$year")) );  // independence day

        $LD = $this->getObservedDate( date('m/d/Y', strtotime("first monday of september $year")) ); //labor day

        $VD = $this->getObservedDate( date('m/d/Y', strtotime("11/11/$year")) ); //veterans day

        $ColD =$this->getObservedDate( date('m/d/Y', strtotime("second monday of october $year")) ); //columbus day   

        $TG = $this->getObservedDate( date('m/d/Y', strtotime("last thursday of november $year")) ); // thanksgiving       

        $CD = $this->getObservedDate( date('m/d/Y', strtotime("12/25/$year")) );  //christmas day 

        $nonWorkingDays = array();

        array_push($nonWorkingDays, $NY, $MLK, $PD, $MDay, $IDay, $LD, $ColD, $VD, $TG, $CD);

        return $nonWorkingDays;
    }


?>

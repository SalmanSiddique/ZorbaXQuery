for $fl in doc("travel.xml")//flight[@from="DFW"]
let $fl_res:=doc("travel.xml")//reservation[@flight=$fl/@id]
return <FlightDetails>{
$fl/@from,
$fl/@to,
$fl/date,
$fl/departureTime,
$fl/arrivalTime,
<TotalFlightReservations>{fn:count($fl_res)}</TotalFlightReservations>
}</FlightDetails>
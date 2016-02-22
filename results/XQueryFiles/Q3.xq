for $ap in doc("travel.xml")//airport
let $dep_fl:=doc("travel.xml")//flight[@from=$ap/@code]
let $ar_fl:=doc("travel.xml")//flight[@to=$ap/@code]
return <AirportDetails>{
$ap/@code,
$ap/name,
<TotalDepartingFlights>{fn:count($dep_fl)}</TotalDepartingFlights>,
<TotalArrivingFlights>{fn:count($ar_fl)}</TotalArrivingFlights>
}</AirportDetails>
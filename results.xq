doc("travel.xml")//flight[@from="DFW" and @to="JFK" and date="11/20/2014"],

for $i in doc("travel.xml")//passenger
let $b:=doc("travel.xml")//reservation[@passenger=$i/@ssn]
let $c:=fn:count($b)
order by $i/@ssn ascending
return <PassengerReservations>{
$i/name,
$i/address,
<TotalReservations>{$c}</TotalReservations>
}</PassengerReservations>,

for $ap in doc("travel.xml")//airport
let $dep_fl:=doc("travel.xml")//flight[@from=$ap/@code]
let $ar_fl:=doc("travel.xml")//flight[@to=$ap/@code]
return <AirportDetails>{
$ap/@code,
$ap/name,
<TotalDepartingFlights>{fn:count($dep_fl)}</TotalDepartingFlights>,
<TotalArrivingFlights>{fn:count($ar_fl)}</TotalArrivingFlights>
}</AirportDetails>,

for $fl in doc("travel.xml")//flight[@from="DFW"]
let $fl_res:=doc("travel.xml")//reservation[@flight=$fl/@id]
return <FlightDetails>{
$fl/@from,
$fl/@to,
$fl/date,
$fl/departureTime,
$fl/arrivalTime,
<TotalFlightReservations>{fn:count($fl_res)}</TotalFlightReservations>
}</FlightDetails>,

for $ps in doc("travel.xml")//passenger[name="John Smith"]
let $ps_res:=doc("travel.xml")//reservation[@passenger=$ps/@ssn]
return <JohnSmithReservations>{
$ps/name,
<TotalFlightReservations>{fn:count($ps_res)}</TotalFlightReservations>
}</JohnSmithReservations>,

let $ps:=doc("travel.xml")//passenger[name="John Smith"]
let $ps_res:=doc("travel.xml")//reservation[@passenger=$ps/@ssn]
let $fl_res:=doc("travel.xml")//flight[@id=$ps_res/@flight]
let $fl_air:=doc("travel.xml")//airport[@code=$fl_res/@to]
return <JohnSmithFlightDestinations>{
$fl_air/name
}</JohnSmithFlightDestinations>

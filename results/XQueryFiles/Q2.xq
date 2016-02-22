for $i in doc("travel.xml")//passenger
let $b:=doc("travel.xml")//reservation[@passenger=$i/@ssn]
let $c:=fn:count($b)
order by $i/@ssn ascending
return <PassengerReservations>{
$i/name,
$i/address,
<TotalReservations>{$c}</TotalReservations>
}</PassengerReservations>
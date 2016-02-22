for $ps in doc("travel.xml")//passenger[name="John Smith"]
let $ps_res:=doc("travel.xml")//reservation[@passenger=$ps/@ssn]
return <JohnSmithReservations>{
$ps/name,
<TotalFlightReservations>{fn:count($ps_res)}</TotalFlightReservations>
}</JohnSmithReservations>
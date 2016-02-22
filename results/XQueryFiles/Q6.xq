let $ps:=doc("travel.xml")//passenger[name="John Smith"]
let $ps_res:=doc("travel.xml")//reservation[@passenger=$ps/@ssn]
let $fl_res:=doc("travel.xml")//flight[@id=$ps_res/@flight]
let $fl_air:=doc("travel.xml")//airport[@code=$fl_res/@to]
return <JohnSmithFlightDestinations>{
$fl_air/name
}</JohnSmithFlightDestinations>
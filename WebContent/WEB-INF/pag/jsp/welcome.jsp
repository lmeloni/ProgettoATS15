<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="bootstrap.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pappa&Buffa</title>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="menu.jsp" %>
<c:if test="${sessionScope.utente != null}">
	<jsp:forward page="homeUtente.jsp"/>
</c:if>
<br>
<h4>Siamo "Pappa e buffa!" e offriamo un servizio che permette ai ristoranti di poter soddisfare con le loro
specialità culinarie, anche i palati di coloro che preferiscono non essere vincolati a rimanere seduti al
tavolo di un ristorante, ma sfruttare la filosofia "take away".
<br>
<br>
Puoi gustarti i tuoi piatti preferiti in ufficio, a casa, all'aria aperta e persino in auto davanti a un bel 
tramonto.
<br>
<br>
Eh allora ordina, pappa e buffa!
</h4>
<hr>
Seusu "Pappa e buffa" e permitteusu ai ristorantisi de soddisfai cun is propriasa
 specialidadis de coxina s'appetitu de cussusu ca no ollinti abarrai sezziusu in sa mesa de su 
 ristoranti,ma sfruttai sa filosofia "piga e pappa".
<br>
<br>
Porisi pappai in su traballu, a dommu, in sa ia, in sa macchina e finzasa in sa littorina.
<br>
<br>
E inzandusu "piga, pappa, buffa e cittidia!"
<hr>
We are "Pappa e buffa!" and we offer a service that allows restaurants to satisfy with their
culinary specialties, also the tastes of those who prefer not to remain seated at
table in a restaurant, but use the take away's philosophy.
<br>
<br>
You can taste your favorite dishes in the office, at home, outdoors and also in your car in front of a beautiful
sunset.
<br>
<br>
So then let's orders, "eat and drink!"
<hr>
Simme "Pappà & buffà!" e offriàm nu' servizio ca' permètt a' ristorànt e' potèr soddisfàr cu e' loro
specialìtà culinariè, pure e' palatì e' colorò ca' preferiscòn nun esserè vincolàt a rimanèr seduti o'
tavòl e' nu' ristorant, ma sfruttàr a' filosofià "piglia e magna".
<br>
<br>
Puoì gustàrt e' tuoi piatti preferìt in ufficiò, a casà, all'arià apertà e persìn in autò nnanze a nu' bel 
tramonto.
<br>
<br>
Jamme ordina, "magna e bev" guagliò! 
<hr>
私たち「パパと面白いです！"私たちはレストランが自分に満足することを可能にするサービスを提供しています
特選料理、に座ったままに拘束されることを好まない人たちでさえ味覚
レストランのテーブルが、 "持ち帰り"哲学の利点を取ります。
あなたは美しいの前にあなたの車の中で屋外であっても、自宅で、オフィスであなたの好きな料理をすることができます
夕日。
え、その後の受注、ゼリーと面白いです！
偶数
</body>
</html>

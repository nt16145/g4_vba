
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional //EN">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>coogle</title>
</head>
<body bgcolor=#ffc0cb>
<h2><font face="ＭＳ ゴシック" color=#3399FF>　企業一覧表</font></h2>
<hr>
<form name="frm" method="post" action="coogle.php" target="_top" onsubmit="return Input_Check();">
<font face="ＭＳ ゴシック">企業名部分一致検索　</font><input type="text" name="company_name" value="" size="20" maxlength="80" style="font-family: ＭＳ 明朝; font-size: 11pt; color: black; background-color: white; ime-mode: auto"><br>
<br>
<font face="ＭＳ 明朝">
　　　　　　　　<input type="submit" value="検索">　<input type="button" value="クリア"  onClick="Input_Clear(frm.srv, frm.uid, frm.pas, frm.dbm)">
</form>
<hr>

<?php
if($_SERVER["REQUEST_METHOD"] == "POST") {
   $company_name = $_POST['company_name'];
   $server = "jocalc1";
   $database = "r01_j4_exp";
   $port_number = "5432";
   $user_id = "nt16145";
   $user_password = "nt16145";
   $connect  = new PDO("pgsql:host=$server;dbname=$database;port=$port_number;user=$user_id;password=$user_password"); 
 
   $sql_text = "select * from company_23 where name like '%".$company_name."%'"; 
 
   $result   = $connect->query($sql_text); 
 
   print "<h3>デーベース検索結果</h3>\n"; // 表の開始(HTML タグ) 
   print "<table border=1 cellspacing=1 cellpadding=1>\n";
   print "<tr>";
   print "<th>code</th>";
   print "<th>name</th>";
   print "<th>address</th>";
   print "<th>phone</th>";
   print "<th>labors</th>";
   print "</tr>";
   $rs = $result->fetchall();
   foreach($rs as $row):
          print "<tr>";
          print '<td>'.$row['code']."</td>";
          print '<td>'.$row['name']."</td>";
          print '<td>'.$row['address']."</td>";
          print '<td>'.$row['phone']."</td>";
          print '<td>'.$row['labors']."</td>";
          print "</tr>\n";       // 表の明細行の終わり
   endforeach;
   print "</table>\n";       // 表の終わ
} else {
   $company_name = "";
}
?>
</font>
</html>
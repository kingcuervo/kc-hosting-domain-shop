<?php error_reporting(0);
interface db
{
	public function connect($server,$username,$password,$dbname);
	public function close();
	public function error();
	
}
class mysqldb implements db
{
	private $server;
	private $username;
	private $password;
	private $dbname;
	private $connection;
	
	public function connect($server,$username,$password,$dbname)
	{
	$this->connection=mysql_connect($server,$username,$password);
        if($this->connection)
        {
            mysql_select_db($dbname, $this->connection) or die("Base de datos no disponible");
            return;
        }
	}
	public function close()
	{
	return mysql_close($this->connection);
	}
	public function error()
	{
	return mysql_error($this->connection);
	}
}
$MysqlDb = new mysqldb();
?>
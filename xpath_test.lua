
local lom = require "lxp.lom"
local xpath = require "xpath"

local xml = [[<PARSEINFO language="mysql" version="32" parser="5.175" flags="0x07800000" source_encoding="8-bit">
<CHUNK status="ok" type="Select" line="2" col="13" size="559" offset="35">
<SELECT>
<EXPR cat="query">
<TOKEN value="SELECT" line="2" col="13" size="6" offset="35" cat="keyword" />
<SELECT_LIST>
<SELECT_ITEM>
<QNAME value="cheese">
<IDENTIFIER value="cheese">
<TOKEN value="cheese" line="2" col="20" size="6" offset="42" cat="identifier" />
</IDENTIFIER>
</QNAME>
</SELECT_ITEM>
<TOKEN value="," line="2" col="26" size="1" offset="48" cat="punctuation" />
<SELECT_ITEM>
<QNAME value="COUNT(*)">
<IDENTIFIER value="COUNT">
<TOKEN value="COUNT" line="2" col="28" size="5" offset="50" cat="identifier" />
</IDENTIFIER>
<TOKEN value="(" line="2" col="33" size="1" offset="55" cat="punctuation" />
<PARAM_LIST>
<PARAM>
<QNAME value="*">
<IDENTIFIER value="*">
<TOKEN value="*" line="2" col="34" size="1" offset="56" cat="identifier" />
</IDENTIFIER>
</QNAME>
</PARAM>
</PARAM_LIST>
<TOKEN value=")" line="2" col="35" size="1" offset="57" cat="punctuation" />
</QNAME>
<ALIAS>
<TOKEN value="AS" line="2" col="37" size="2" offset="59" cat="keyword" />
<QNAME value="num_sales">
<IDENTIFIER value="num_sales">
<TOKEN value="num_sales" line="2" col="40" size="9" offset="62" cat="identifier" />
</IDENTIFIER>
</QNAME>
</ALIAS>
</SELECT_ITEM>
<TOKEN value="," line="2" col="49" size="1" offset="71" cat="punctuation" />
<SELECT_ITEM>
<QNAME value="SUM(s.sale_value)">
<IDENTIFIER value="SUM">
<TOKEN value="SUM" line="2" col="51" size="3" offset="73" cat="identifier" />
</IDENTIFIER>
<TOKEN value="(" line="2" col="54" size="1" offset="76" cat="punctuation" />
<PARAM_LIST>
<PARAM>
<QNAME value="s.sale_value">
<IDENTIFIER value="s">
<TOKEN value="s" line="2" col="55" size="1" offset="77" cat="identifier" />
</IDENTIFIER>
<TOKEN value="." line="2" col="56" size="1" offset="78" cat="punctuation" />
<IDENTIFIER value="sale_value">
<TOKEN value="sale_value" line="2" col="57" size="10" offset="79" cat="identifier" />
</IDENTIFIER>
</QNAME>
</PARAM>
</PARAM_LIST>
<TOKEN value=")" line="2" col="67" size="1" offset="89" cat="punctuation" />
</QNAME>
<ALIAS>
<QNAME value="total_sales">
<IDENTIFIER value="total_sales">
<TOKEN value="total_sales" line="2" col="69" size="11" offset="91" cat="identifier" />
</IDENTIFIER>
</QNAME>
</ALIAS>
</SELECT_ITEM>
</SELECT_LIST>
<TOKEN value="FROM" line="3" col="13" size="4" offset="116" cat="keyword" />
<TABLE_REF_LIST>
<TABLE_REF>
<JOIN type="cross">
<TABLE_REF>
<TOKEN value="(" line="4" col="13" size="1" offset="134" cat="punctuation" />
<EXPR cat="query">
<EXPR cat="union_all">
<EXPR cat="query">
<TOKEN value="SELECT" line="5" col="17" size="6" offset="152" cat="keyword" />
<SELECT_LIST>
<SELECT_ITEM>
<QNAME value="customer_id">
<IDENTIFIER value="customer_id">
<TOKEN value="customer_id" line="5" col="24" size="11" offset="159" cat="identifier" />
</IDENTIFIER>
</QNAME>
<ALIAS>
<TOKEN value="as" line="5" col="36" size="2" offset="171" cat="keyword" />
<QNAME value="cheese">
<IDENTIFIER value="cheese">
<TOKEN value="cheese" line="5" col="39" size="6" offset="174" cat="identifier" />
</IDENTIFIER>
</QNAME>
</ALIAS>
</SELECT_ITEM>
<TOKEN value="," line="5" col="45" size="1" offset="180" cat="punctuation" />
<SELECT_ITEM>
<QNAME value="contact_firstname">
<IDENTIFIER value="contact_firstname">
<TOKEN value="contact_firstname" line="5" col="47" size="17" offset="182" cat="identifier" />
</IDENTIFIER>
</QNAME>
</SELECT_ITEM>
</SELECT_LIST>
<TOKEN value="FROM" line="5" col="65" size="4" offset="200" cat="keyword" />
<TABLE_REF_LIST>
<TABLE_REF>
<QNAME value="test_odbc.customers">
<IDENTIFIER value="test_odbc">
<TOKEN value="test_odbc" line="5" col="70" size="9" offset="205" cat="identifier" />
</IDENTIFIER>
<TOKEN value="." line="5" col="79" size="1" offset="214" cat="punctuation" />
<IDENTIFIER value="customers">
<TOKEN value="customers" line="5" col="80" size="9" offset="215" cat="identifier" />
</IDENTIFIER>
</QNAME>
<ALIAS>
<QNAME value="c">
<IDENTIFIER value="c">
<TOKEN value="c" line="5" col="90" size="1" offset="225" cat="identifier" />
</IDENTIFIER>
</QNAME>
</ALIAS>
</TABLE_REF>
</TABLE_REF_LIST>
<WHERE>
<TOKEN value="WHERE" line="5" col="92" size="5" offset="227" cat="keyword" />
<EXPR cat="gt">
<QNAME value="YEAR(c.date_of_birth)">
<IDENTIFIER value="YEAR">
<TOKEN value="YEAR" line="5" col="98" size="4" offset="233" cat="identifier" />
</IDENTIFIER>
<TOKEN value="(" line="5" col="102" size="1" offset="237" cat="punctuation" />
<PARAM_LIST>
<PARAM>
<QNAME value="c.date_of_birth">
<IDENTIFIER value="c">
<TOKEN value="c" line="5" col="103" size="1" offset="238" cat="identifier" />
</IDENTIFIER>
<TOKEN value="." line="5" col="104" size="1" offset="239" cat="punctuation" />
<IDENTIFIER value="date_of_birth">
<TOKEN value="date_of_birth" line="5" col="105" size="13" offset="240" cat="identifier" />
</IDENTIFIER>
</QNAME>
</PARAM>
</PARAM_LIST>
<TOKEN value=")" line="5" col="118" size="1" offset="253" cat="punctuation" />
</QNAME>
<TOKEN value="&gt;" line="5" col="120" size="1" offset="255" cat="punctuation" />
<LITERAL type="numeric" value="1983">
<TOKEN value="1983" line="5" col="122" size="4" offset="257" cat="literal" />
</LITERAL>
</EXPR>
</WHERE>
</EXPR>
<TOKEN value="UNION" line="6" col="17" size="5" offset="278" cat="keyword" />
<TOKEN value="ALL" line="6" col="23" size="3" offset="284" cat="keyword" />
<EXPR cat="query">
<TOKEN value="SELECT" line="7" col="17" size="6" offset="305" cat="keyword" />
<SELECT_LIST>
<SELECT_ITEM>
<QNAME value="customer_id">
<IDENTIFIER value="customer_id">
<TOKEN value="customer_id" line="7" col="24" size="11" offset="312" cat="identifier" />
</IDENTIFIER>
</QNAME>
<ALIAS>
<TOKEN value="as" line="7" col="36" size="2" offset="324" cat="keyword" />
<QNAME value="cheese">
<IDENTIFIER value="cheese">
<TOKEN value="cheese" line="7" col="39" size="6" offset="327" cat="identifier" />
</IDENTIFIER>
</QNAME>
</ALIAS>
</SELECT_ITEM>
<TOKEN value="," line="7" col="45" size="1" offset="333" cat="punctuation" />
<SELECT_ITEM>
<QNAME value="contact_firstname">
<IDENTIFIER value="contact_firstname">
<TOKEN value="contact_firstname" line="7" col="47" size="17" offset="335" cat="identifier" />
</IDENTIFIER>
</QNAME>
</SELECT_ITEM>
</SELECT_LIST>
<TOKEN value="FROM" line="7" col="65" size="4" offset="353" cat="keyword" />
<TABLE_REF_LIST>
<TABLE_REF>
<QNAME value="test_odbc2.customers">
<IDENTIFIER value="test_odbc2">
<TOKEN value="test_odbc2" line="7" col="70" size="10" offset="358" cat="identifier" />
</IDENTIFIER>
<TOKEN value="." line="7" col="80" size="1" offset="368" cat="punctuation" />
<IDENTIFIER value="customers">
<TOKEN value="customers" line="7" col="81" size="9" offset="369" cat="identifier" />
</IDENTIFIER>
</QNAME>
<ALIAS>
<QNAME value="c">
<IDENTIFIER value="c">
<TOKEN value="c" line="7" col="91" size="1" offset="379" cat="identifier" />
</IDENTIFIER>
</QNAME>
</ALIAS>
</TABLE_REF>
</TABLE_REF_LIST>
<WHERE>
<TOKEN value="WHERE" line="7" col="93" size="5" offset="381" cat="keyword" />
<EXPR cat="lt">
<QNAME value="YEAR(c.date_of_birth)">
<IDENTIFIER value="YEAR">
<TOKEN value="YEAR" line="7" col="99" size="4" offset="387" cat="identifier" />
</IDENTIFIER>
<TOKEN value="(" line="7" col="103" size="1" offset="391" cat="punctuation" />
<PARAM_LIST>
<PARAM>
<QNAME value="c.date_of_birth">
<IDENTIFIER value="c">
<TOKEN value="c" line="7" col="104" size="1" offset="392" cat="identifier" />
</IDENTIFIER>
<TOKEN value="." line="7" col="105" size="1" offset="393" cat="punctuation" />
<IDENTIFIER value="date_of_birth">
<TOKEN value="date_of_birth" line="7" col="106" size="13" offset="394" cat="identifier" />
</IDENTIFIER>
</QNAME>
</PARAM>
</PARAM_LIST>
<TOKEN value=")" line="7" col="119" size="1" offset="407" cat="punctuation" />
</QNAME>
<TOKEN value="&lt;" line="7" col="121" size="1" offset="409" cat="punctuation" />
<LITERAL type="numeric" value="1951">
<TOKEN value="1951" line="7" col="123" size="4" offset="411" cat="literal" />
</LITERAL>
</EXPR>
</WHERE>
</EXPR>
</EXPR>
</EXPR>
<TOKEN value=")" line="8" col="13" size="1" offset="428" cat="punctuation" />
<ALIAS>
<QNAME value="t">
<IDENTIFIER value="t">
<TOKEN value="t" line="8" col="15" size="1" offset="430" cat="identifier" />
</IDENTIFIER>
</QNAME>
</ALIAS>
</TABLE_REF>
<TOKEN value="JOIN" line="9" col="13" size="4" offset="444" cat="keyword" />
<TABLE_REF>
<QNAME value="test_odbc.sales">
<IDENTIFIER value="test_odbc">
<TOKEN value="test_odbc" line="9" col="18" size="9" offset="449" cat="identifier" />
</IDENTIFIER>
<TOKEN value="." line="9" col="27" size="1" offset="458" cat="punctuation" />
<IDENTIFIER value="sales">
<TOKEN value="sales" line="9" col="28" size="5" offset="459" cat="identifier" />
</IDENTIFIER>
</QNAME>
<ALIAS>
<QNAME value="s">
<IDENTIFIER value="s">
<TOKEN value="s" line="9" col="34" size="1" offset="465" cat="identifier" />
</IDENTIFIER>
</QNAME>
</ALIAS>
</TABLE_REF>
<JOIN_ON>
<TOKEN value="ON" line="10" col="13" size="2" offset="480" cat="keyword" />
<TOKEN value="(" line="10" col="16" size="1" offset="483" cat="punctuation" />
<EXPR cat="eq">
<QNAME value="s.customer_id">
<IDENTIFIER value="s">
<TOKEN value="s" line="10" col="17" size="1" offset="484" cat="identifier" />
</IDENTIFIER>
<TOKEN value="." line="10" col="18" size="1" offset="485" cat="punctuation" />
<IDENTIFIER value="customer_id">
<TOKEN value="customer_id" line="10" col="19" size="11" offset="486" cat="identifier" />
</IDENTIFIER>
</QNAME>
<TOKEN value="=" line="10" col="31" size="1" offset="498" cat="punctuation" />
<QNAME value="t.cheese">
<IDENTIFIER value="t">
<TOKEN value="t" line="10" col="33" size="1" offset="500" cat="identifier" />
</IDENTIFIER>
<TOKEN value="." line="10" col="34" size="1" offset="501" cat="punctuation" />
<IDENTIFIER value="cheese">
<TOKEN value="cheese" line="10" col="35" size="6" offset="502" cat="identifier" />
</IDENTIFIER>
</QNAME>
</EXPR>
<TOKEN value=")" line="10" col="41" size="1" offset="508" cat="punctuation" />
</JOIN_ON>
</JOIN>
</TABLE_REF>
</TABLE_REF_LIST>
<GROUP_BY>
<TOKEN value="GROUP" line="11" col="13" size="5" offset="522" cat="keyword" />
<TOKEN value="BY" line="11" col="19" size="2" offset="528" cat="keyword" />
<QNAME value="s.customer_id">
<IDENTIFIER value="s">
<TOKEN value="s" line="11" col="22" size="1" offset="531" cat="identifier" />
</IDENTIFIER>
<TOKEN value="." line="11" col="23" size="1" offset="532" cat="punctuation" />
<IDENTIFIER value="customer_id">
<TOKEN value="customer_id" line="11" col="24" size="11" offset="533" cat="identifier" />
</IDENTIFIER>
</QNAME>
</GROUP_BY>
<ORDER_LIST>
<TOKEN value="ORDER" line="12" col="13" size="5" offset="558" cat="keyword" />
<TOKEN value="BY" line="12" col="19" size="2" offset="564" cat="keyword" />
<ORDER_ITEM>
<QNAME value="num_sales">
<IDENTIFIER value="num_sales">
<TOKEN value="num_sales" line="12" col="22" size="9" offset="567" cat="identifier" />
</IDENTIFIER>
</QNAME>
</ORDER_ITEM>
<TOKEN value="," line="12" col="31" size="1" offset="576" cat="punctuation" />
<ORDER_ITEM order="desc">
<QNAME value="total_sales">
<IDENTIFIER value="total_sales">
<TOKEN value="total_sales" line="12" col="33" size="11" offset="578" cat="identifier" />
</IDENTIFIER>
</QNAME>
<TOKEN value="DESC" line="12" col="45" size="4" offset="590" cat="keyword" />
</ORDER_ITEM>
</ORDER_LIST>
</EXPR>
</SELECT>
</CHUNK>
</PARSEINFO>]]

local xml_tree = lom.parse(xml)

local tests = {
	
	{
		query = '//TOKEN[@cat="keyword"]/@value',
		count = 20,
		results = {
			'SELECT',
			'FROM',
			'AS',
			'JOIN',
			'UNION',
			'ALL',
			'SELECT',
			'FROM',
			'as',
			'WHERE',
			'SELECT',
			'FROM',
			'as',
			'WHERE',
			'ON',
			'GROUP',
			'BY',
			'ORDER',
			'BY',
			'DESC',
		}
	},
	
	{
		query = '//EXPR[@cat="query"]//EXPR[@cat="query"]//TOKEN[@cat="keyword"]',
		count= 26,
	},
	
	{
		query = '//EXPR[@cat="query"]//TOKEN[@cat="keyword"]/@value',
		count = 38,
		results = {
			'SELECT',
			'FROM',
			'AS',
			'JOIN',
			'UNION',
			'ALL',
			'SELECT',
			'FROM',
			'as',
			'WHERE',
			'SELECT',
			'FROM',
			'as',
			'WHERE',
			'ON',
			'GROUP',
			'BY',
			'ORDER',
			'BY',
			'DESC',
			'UNION',
			'ALL',
			'SELECT',
			'FROM',
			'as',
			'WHERE',
			'SELECT',
			'FROM',
			'as',
			'WHERE',
			'SELECT',
			'FROM',
			'as',
			'WHERE',
			'SELECT',
			'FROM',
			'as',
			'WHERE',
		}
	},
	
	{
		query = '//*[@cat]',
		count = 97,
	},
	
	{
		query = 'SELECT_LIST//TOKEN[@cat="identifier"]',
		count = 0,
	},
	
	{
		query = '//SELECT_LIST/text()',
		count = 3,
	},
	
	{
		query = '/PARSEINFO',
		count = 1,
	},
	
	{
		query = '/CHUNK',
		count = 0,
	},
	
	{
		query = './CHUNK',
		count = 1,
	},
	
	{
		query = 'CHUNK[@type="Select"]//EXPR[@cat="query"]',
		count = 4,
	},
	
	{
		query = '//*', -- all nodes
		count = 211,
	},

	{
		query = '//*[@*]', -- any node with an attribute
		count = 170,
	},
	
	{
		query = '//SELECT_ITEM/QNAME/@value | //TABLE_REF/QNAME/@value',
		count = 10,
		results = {
			'cheese',
			'COUNT(*)',
			'SUM(s.sale_value)',
			'customer_id',
			'contact_firstname',
			'customer_id',
			'contact_firstname',
			'test_odbc.sales',
			'test_odbc.customers',
			'test_odbc2.customers',
		}
	},
	
	{
		query = '//TOKEN[@cat="keyword"]/..', -- parent
		count = 20,
		results = {
			'EXPR',
			'EXPR',
			'ALIAS',
			'JOIN',
			'EXPR',
			'EXPR',
			'EXPR',
			'EXPR',
			'ALIAS',
			'WHERE',
			'EXPR',
			'EXPR',
			'ALIAS',
			'WHERE',
			'JOIN_ON',
			'GROUP_BY',
			'GROUP_BY',
			'ORDER_LIST',
			'ORDER_LIST',
			'ORDER_ITEM',
		}
	},
	
	{
		query = '//EXPR[SELECT_LIST]',
		count = 3,
	},
	
	{
		query = '//TOKEN[@value="SELECT"]/../SELECT_LIST', -- sibling
		count = 3,
	},
	
	{
		query = '//TOKEN[@value="SELECT"]/../../EXPR/@cat', -- parents siblings
		count = 5,
	},
	
	{
		query = '/.//PARSEINFO//EXPR/./*[@cat]', -- should select everything with a cat under EXPR
		count = 14,
	},
	
	{
		query = '//ALIAS/QNAME[IDENTIFIER][1]/@value',
		count = 1,
		result = { 'num_sales' }
	},
	
	{
		query = '//ALIAS/QNAME[IDENTIFIER][2]/@value',
		count = 1,
		result = { 'total_sales' }
	},
	
	{
		query = '//ALIAS/QNAME[BLA][2]/@value',
		count = 0,
	},
	
	{
		query = '//ALIAS/QNAME[IDENTIFIER][3]/@value',
		count = 1,
		result = { 't' }
	},
	
	{
		query = '//TOKEN[@value="UNION"]/../*',
		count = 4,
	},
	
	{
		query = '//TOKEN[@value="UNION"]/../*/@value',
		count = 2,
		result = {
			'UNION',
			'ALL',
		}
	},
	
	{
		query = '//TOKEN[@value="UNION"]/../*',
		count = 4,
	},
	
	{
		query = '//TOKEN[@value="UNION"]/../../*',
		count = 1,
	},
	
	{
		query = '//TOKEN[@value="UNION"]/../*[1]',
		count = 1,
	},
	
}


io.write('testing xpath.lua\n')
for _,test in ipairs(tests) do
	local failed = false
	local xpath_query = test.query

	local nodes = xpath.selectNodes(xml_tree, xpath_query)
	local node_count = #nodes
	
	-- compare result count
	if node_count ~= test.count then
		failed = true
		
	-- compare against expected results if there are any
	elseif test.results then
		for i=1,node_count do
			local node_result = nodes[i].tag or nodes[i]
			local expected_result = test.results[i]
			
			if node_result ~= expected_result then
				failed = true
			end
		end
	end
	
	if failed then
		io.write('F')
	else
		io.write('.')
	end
end
io.write('\n')

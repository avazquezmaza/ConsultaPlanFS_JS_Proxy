xquery version "3.0" encoding "UTF-8";

(:: pragma  parameter="$anyType" type="xs:anyType" ::)
(:: pragma  type="xs:anyType" ::)

declare namespace xf = "http://tempuri.org/App%20Movil%20Home/resources/xquery/removeNamespace/";

declare function xf:removeNamespace($anyType as element(*))
    as element(*) {

						element {xs:QName(local-name($anyType))}
						
						{
						
						for $child in $anyType/(@*,node())
						
						return
						
						if ($child instance of element())
						
						then xf:removeNamespace($child)
						
						else $child
						
						}

};

declare variable $anyType as element(*) external;

xf:removeNamespace($anyType)
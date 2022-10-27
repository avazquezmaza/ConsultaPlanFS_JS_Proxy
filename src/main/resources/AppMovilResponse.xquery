xquery version "3.0" encoding "UTF-8";
(:: pragma  parameter="$Mensaje" type="anyType" ::)
(:: pragma bea:schema-type-return type="ns0:Response" location="../schemas/AppMovilResponse.xsd" ::)

declare namespace ns0 = "http://Movistar.com/AppMovilResponse";

declare function local:AppMovilResponse($Mensaje as element(*))
    as element() {
            <Result>
                { $Mensaje/@* , $Mensaje/node() }
            </Result>
};

declare variable $Mensaje as element(*) external;

local:AppMovilResponse($Mensaje)
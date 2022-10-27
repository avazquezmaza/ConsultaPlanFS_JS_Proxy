xquery version "3.0" encoding "UTF-8";

declare namespace xf = "http://tempuri.org/AppMovil/Resources/XQUERY/faultJSON/";

declare function xf:faultJSON($Code as xs:string, $Message as xs:string, $Detail as xs:string)
    as xs:string {
        concat('{"Fault":{',
        '"Code":"',$Code , '",',
        '"Message":"',$Message , '",',
        '"Detail":"',$Detail,'"',
        '}}')
};

declare variable $Code as xs:string external;
declare variable $Message as xs:string external;
declare variable $Detail as xs:string external;

xf:faultJSON($Code, $Message, $Detail)
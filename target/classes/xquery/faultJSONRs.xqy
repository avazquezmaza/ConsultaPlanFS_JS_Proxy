xquery version "2004-draft";
declare namespace xf = "http://tempuri.org/AppMovil/Resources/XQUERY/faultJSON/";

declare function xf:faultJSON($Code as xs:string,
    $Message as xs:string,
    $Detail as xs:string)
    as xs:string {
        concat('{&#10;"Fault":{&#10;',
        '"Code":"',$Code , '",&#10;',
        '"Message":"',$Message , '",&#10;',
        '"Detail":"',$Detail,'"&#10;',
        '}&#10;}')
};

declare variable $Code as xs:string external;
declare variable $Message as xs:string external;
declare variable $Detail as xs:string external;

xf:faultJSON($Code,
    $Message,
    $Detail)
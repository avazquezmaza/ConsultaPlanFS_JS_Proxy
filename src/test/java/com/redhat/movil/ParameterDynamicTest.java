package com.redhat.movil;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.math.BigInteger;

import org.junit.Before;
import org.junit.Test;

import net.sf.saxon.Configuration;
import net.sf.saxon.om.Item;
import net.sf.saxon.om.StructuredQName;
import net.sf.saxon.query.DynamicQueryContext;
import net.sf.saxon.query.XQueryExpression;
import net.sf.saxon.value.BooleanValue;
import net.sf.saxon.value.DoubleValue;
import net.sf.saxon.value.FloatValue;
import net.sf.saxon.value.Int64Value;
import net.sf.saxon.value.IntegerValue;
import net.sf.saxon.value.ObjectValue;
import net.sf.saxon.value.StringValue;

public class ParameterDynamicTest {

    
//    private static final String TEST_QUERY = new StringBuilder()
//            .append("xquery version \"3.0\" encoding \"UTF-8\";\n"
//                    + "\n"
//                    + "declare namespace xf = \"http://tempuri.org/AppMovil/Resources/XQUERY/faultJSON/\";\n"
//                    + "\n"
//                    + "declare function xf:faultJSON($Code as xs:string, $Message as xs:string, $Detail as xs:string)\n"
//                    + "    as xs:string {\n"
//                    + "        concat('{\"Fault\":{',\n"
//                    + "        '\"Code\":\"',$Code , '\",',\n"
//                    + "        '\"Message\":\"',$Message , '\",',\n"
//                    + "        '\"Detail\":\"',$Detail,'\"',\n"
//                    + "        '}}')\n"
//                    + "};\n"
//                    + "declare variable $Code as xs:string external;\n"
//                    + "declare variable $Message as xs:string external;\n"
//                    + "declare variable $Detail as xs:string external;\n"
//                    + "\n"
//                    + "xf:faultJSON($Code, $Message, $Detail)")
//            .toString();
    
    private static final String TEST_QUERY = new StringBuilder()
            .append("xquery version \"3.0\" encoding \"UTF-8\";\n")
            .append("declare variable $in.body external;\n")
            .append("data($in.body)")
            .toString();

    Configuration conf = new Configuration();

    XQueryExpression query;

    DynamicQueryContext context;

    @Before
    public void setup() throws Exception {
        conf.setCompileWithTracing(true);
        query = conf.newStaticQueryContext().compileQuery(TEST_QUERY);
        context = new DynamicQueryContext(conf);
    }

    /**
     * This is what Camel XQueryBuilder should execute to allow Saxon to bind the
     * parameter type properly.
     */
    @Test
    public void testBooleanParameter() throws Exception {
        
        System.out.println(TEST_QUERY);

		Item message = getAsParameter("Business Error");
		Item code = getAsParameter("1052");
		Item detail = getAsParameter("Los argumentos suministrados son incorrectos");

//        context.setParameter(StructuredQName.fromClarkName("Message"), message);
//        context.setParameter(StructuredQName.fromClarkName("Code"), code);
//        context.setParameter(StructuredQName.fromClarkName("Detail"), detail);

		context.setParameter(StructuredQName.fromClarkName("in.body"), detail);
		
        Item result = query.iterator(context).next();
        System.out.println(result);
        assertTrue(result instanceof StringValue);
    }
    
    protected Item getAsParameter(Object value) {
        if (value instanceof String) {
            return new StringValue((CharSequence) value);
        } else if (value instanceof Boolean) {
            return BooleanValue.get((Boolean) value);
        } else if (value instanceof Long) {
            return Int64Value.makeIntegerValue((Long) value);
        } else if (value instanceof BigInteger) {
            return IntegerValue.makeIntegerValue((BigInteger) value);
        } else if (value instanceof Double) {
            return DoubleValue.makeDoubleValue((double) value);
        } else if (value instanceof Float) {
            return FloatValue.makeFloatValue((float) value);
        } else {
            return new ObjectValue(value);
        }
    }

}
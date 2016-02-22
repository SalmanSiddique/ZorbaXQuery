/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project7;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.XMLReader;


final class ValidateDTD {
    public static void main ( String args[] ) throws Exception {
        SAXParserFactory factory = SAXParserFactory.newInstance();
        factory.setValidating(true);
        factory.setNamespaceAware(true);
        XMLReader xmlReader = factory.newSAXParser().getXMLReader();
        xmlReader.parse("travel.xml");
    }
}
package com.api.automation.introductoryrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

/**
 * @author MaheshBhosale
 * @created 06/06/2024
 * @project karate-automation
 */
public class TestGetRunner {

//    @Test
//    public Karate runTestGet() {
//        return Karate.run("getrequestjsonresponse.feature").relativeTo(getClass());
//    }

    @Test
    public Karate runTestGet() {
        return Karate.run("jsonfilematcherresponse.feature").relativeTo(getClass());
    }

//    @Test
//    public Karate runTestGet() {
//        return Karate.run("xmlfilematcherresponse.feature").relativeTo(getClass());
//    }

//    @Test
//    public Karate runTestGet() {
//        return Karate.run("postmultipartfile.feature").relativeTo(getClass());
//    }

//    @Test
//    public Karate runTestGet() {
//        return Karate.run("getrequestjxmlresponse.feature").relativeTo(getClass());
//    }

//    @Test
//    public Karate runTestGet() {
//        return Karate.run("getrequestjsonresponse.feature", "getrequestjxmlresponse.feature").relativeTo(getClass());
//    }

//    @Test
//    public Karate runTestGetUsingClassPath(){
//        return Karate.run("classpath:com/api/automation/getrequest/getSecuredRequest.feature");
//    }
}

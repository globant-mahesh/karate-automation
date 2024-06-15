package com.api.automation.putrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

/**
 * @author MaheshBhosale
 * @created 06/11/2024
 * @project karate-automation
 */
public class TestPutFileRunner {

    @Test
    public Karate runTestGet() {
        return Karate.run("putrequest.feature").relativeTo(getClass());
    }

}

package com.api.automation.e2e;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

/**
 * @author MaheshBhosale
 * @created 06/11/2024
 * @project karate-automation
 */
public class TestPutRequestWithDataCreationRunner {

    @Test
    public Karate runTestGet() {
        return Karate.run("putrequest.feature").relativeTo(getClass());
    }

}

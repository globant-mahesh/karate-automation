package com.api.automation.secured;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

/**
 * @author MaheshBhosale
 * @created 06/06/2024
 * @project karate-automation
 */
public class TestSecuredGetRunner {

    @Test
    public Karate runTestGet() {
        return Karate.run("getSecuredRequest.feature").relativeTo(getClass());
    }

}

package com.api.automation.postfile;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

/**
 * @author MaheshBhosale
 * @created 06/11/2024
 * @project karate-automation
 */
public class TestPostFileRunner {

    @Test
    public Karate runTestGet() {
        return Karate.run("postmultipartfile.feature").relativeTo(getClass());
    }

}

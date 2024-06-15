package com.api.automation.datadriven;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

/**
 * @author MaheshBhosale
 * @created 06/11/2024
 * @project karate-automation
 */
public class TestDataDrivenPostFileRunner {

    @Test
    public Karate runTestGet() {
        return Karate.run("dataCreatorPost.feature").relativeTo(getClass());
    }

}

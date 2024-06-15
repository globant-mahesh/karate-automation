package com.api.automation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @author MaheshBhosale
 * @created 06/12/2024
 * @project karate-automation
 */
public class ParallelRunner {

    private static final String CLASSPATH = "classpath:";

    @Test
    public void runIntroductoryTests() {
        Builder builder = new Builder();
//        Generate Json files needed for masterthought reporting
        builder.path(CLASSPATH + System.getProperty("testDir", "com/api/automation")).tags(System.getProperty("tags", "@SmokeTest")).outputCucumberJson(true);
        Results result = builder.parallel(6);
        generateReport(result.getReportDir());
        System.out.println("--------------------------------Report generated at" + result.getReportDir());
        Assertions.assertEquals(0, result.getFailCount(), "There are failed Test cases");
    }

    public void generateReport(String reportDir) {
        File reportOutputDirectory = new File(reportDir);
        List<String> jsonFileAbsolutePaths = new ArrayList<>();

        Collection<File> jsonFiles = FileUtils.listFiles(reportOutputDirectory, new String[]{"json"}, true);
        jsonFiles.forEach(jsonFile -> jsonFileAbsolutePaths.add(jsonFile.getAbsolutePath()));

        Configuration configuration = new Configuration(reportOutputDirectory, "Test results");
        ReportBuilder reportBuilder = new ReportBuilder(jsonFileAbsolutePaths, configuration);
        reportBuilder.generateReports();
    }
}

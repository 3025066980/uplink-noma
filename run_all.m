clc;close all;

subject = 'Simulation Progress';

scenarios = {   
%'DL_Coverage_CoverageThreshold_C2A', ...
%'DL_Coverage_CoverageThreshold_C2C', ...
'DL_Coverage_SmallCellsDensity_C2A', ...
'DL_Coverage_SmallCellsDensity_C2C', ...
'DL_Coverage_HTC_Density_C2A', ...
'DL_Coverage_HTC_Density_C2C', ...
'DL_Coverage_MTC_Density_C2A', ...
'DL_Coverage_MTC_Density_C2C', ...
'DL_Coverage_NOMA_PC_C2A', ...
'DL_Coverage_NOMA_PC_C2C', ...
};
for i = 1:length(scenarios)
    scenario = scenarios{i};
    disp(char(datetime))
    try
        gen_coverage_results_mMTC_NOMA_UDN_Downlink(scenario);
        send_report_via_email(subject,strcat(scenario ,' has been finished at: ' , char(datetime)));
    catch err
        disp(err)
        send_report_via_email(subject,strcat(scenario ,' has been failed at: ' , char(datetime),':',err.message));
    end  
end

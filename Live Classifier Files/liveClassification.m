% A function for live RPS classification of EMG data from the Pison armband
% EMG devices. It will use the dataPrep function to prepare the live data
% for our classifier, load our classifier, run the classifier on the data
% and export its prediction.

% RENAME THE VARIABLES IN HERE LATER, NOT SURE WHAT TO CALL IT OTHERWISE
% REMOVE THE INCLUDED FEATURES EVENTUALLY SINCE THAT WILL LIKELY BE HARD
% CODED IN THE FINAL FUNCTIONS

function [ypred] = liveClassification(data)
    % Prepare the data for the classifier
    includedFeatures = {'var','mean', 'mode', 'median', 'range', 'std', 'mad'}; 
    selected_features = [21 22 23 24 25 26 27 28];
    [dataChTimeTr] = preprocessData(data);   %Consider removing labels input
    feature_table = pullFeatures(dataChTimeTr,includedFeatures);
     selected_feature_table = feature_table(:,selected_features);

    % Load our pre-saved RPS classifier
    load("mymodel.mat", "currentClassifier")
    % Run the classifier on our live features
    ypred = currentClassifier.predictFcn(selected_feature_table);
    % Output our classifier's prediction
    
end
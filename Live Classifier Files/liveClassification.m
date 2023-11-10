% A function for live RPS classification of EMG data from the Pison armband
% EMG devices. It will use the dataPrep function to prepare the live data
% for our classifier, load our classifier, run the classifier on the data
% and export its prediction.

% RENAME THE VARIABLES IN HERE LATER, NOT SURE WHAT TO CALL IT OTHERWISE
% REMOVE THE INCLUDED FEATURES EVENTUALLY SINCE THAT WILL LIKELY BE HARD
% CODED IN THE FINAL FUNCTIONS

function [ypred] = liveClassification(data,labels,includedFeatures)
    % Prepare the data for the classifier
    [dataChTimeTr,gesturelist] = preprocessData(data,labels);
    feature_table = pullFeatures(dataChTimeTr,includedFeatures);

    % Load our pre-saved RPS classifier
    load("mymodel.mat")
    % Run the classifier on our live features
    ypred = currentClassifier.predictFcn(feature_table);
    % Output our classifier's prediction
    
end
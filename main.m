clc;
% 指定文件夹路径（请替换为实际路径）
folderPath = 'E:\工作\轨迹预测\飞机轨迹数据集\数据4-随机轨迹生成\data\circle';

% 获取文件夹内所有CSV文件的信息
files = dir(fullfile(folderPath, '*.xlsx'));

% 初始化一个空表，用于存储所有数据
allData = table();

% 循环读取每个CSV文件并合并数据
for i = 1:length(files)
    % 构建当前CSV文件的完整路径
    filePath = fullfile(folderPath, files(i).name);
    
    % 读取CSV文件到表格中
    tempData = readtable(filePath);
    
    % 合并数据（假设所有CSV文件的表结构相同）
    allData = [allData; tempData];
end

% 指定合并后数据保存的新CSV文件名称
outputFile = fullfile(folderPath, 'merged_data2.xlsx');

% 将合并后的数据写入新的CSV文件
writetable(allData, outputFile);

disp('所有CSV文件已合并并保存到 merged_data.xlsx 文件中');

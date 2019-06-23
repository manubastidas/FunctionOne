clear
close all
clc

addpath(genpath(pwd))

%% Load the SPE10 DATA
% Fine-scale permemability field
file    = 'kSpe10';
field  = load(file);
% field   = field1(1:2:end);
K_perm  = reshape(field,60,220);
% Cut permeability
K_perm  = K_perm(1:60,1:200);
K_perm  = [K_perm K_perm(:,end)];
K_perm  = [K_perm;K_perm(end,:)];

%% Calculation Effective permemability

% Example with an uniform partition
gridX = 0:5:200;
gridY = 0:5:60;
[PermEffective] = FunctionOne(K_perm,gridX,gridY)

%% Graphics (TO CHECK THE OUTPUTS)
[xx_perm,yy_perm] = meshgrid(0:200,0:60);

% ORIGINAL PERMEABILITY
figure('name','Permeability');
surf((K_perm),'edgecolor','none');
colormap jet
view([0,90])
axis tight equal
grid off
box on
c = colorbar;
caxis([min((K_perm(:))), max((K_perm(:)))])

%% EFFECTIVE PERMEABILITY
% [xx_perm,yy_perm] = meshgrid(gridX,gridY);
figure('name','Original Field1')
surf((PermEffective(:,:,1)),'edgecolor','none');
colormap jet
view([0,90])
axis tight equal
grid off
box on
c = colorbar;
caxis([min((K_perm(:))), max((K_perm(:)))])
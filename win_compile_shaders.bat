
cd src\refresh\vkpt\shader

for %%a in (*.comp) do glslangValidator --target-env vulkan1.1 -DVKPT_SHADER -DSHADER_STAGE_COMP %%a -o ..\..\..\..\shader_vkpt\%%a.spv
for %%a in (*.vert) do glslangValidator --target-env vulkan1.1 -DVKPT_SHADER -DSHADER_STAGE_VERT %%a -o ..\..\..\..\shader_vkpt\%%a.spv
for %%a in (*.frag) do glslangValidator --target-env vulkan1.1 -DVKPT_SHADER -DSHADER_STAGE_FRAG %%a -o ..\..\..\..\shader_vkpt\%%a.spv
for %%a in (*.rcall) do glslangValidator --target-env vulkan1.1 -DVKPT_SHADER -DSHADER_STAGE_RCALL %%a -o ..\..\..\..\shader_vkpt\%%a.spv
for %%a in (*.rchit) do glslangValidator --target-env vulkan1.1 -DVKPT_SHADER -DSHADER_STAGE_RCHIT %%a -o ..\..\..\..\shader_vkpt\%%a.spv
for %%a in (*.rgen) do glslangValidator --target-env vulkan1.1 -DVKPT_SHADER -DSHADER_STAGE_RGEN %%a -o ..\..\..\..\shader_vkpt\%%a.spv
for %%a in (*.rmiss) do glslangValidator --target-env vulkan1.1 -DVKPT_SHADER -DSHADER_STAGE_RMISS %%a -o ..\..\..\..\shader_vkpt\%%a.spv

cd ..\..\..\..
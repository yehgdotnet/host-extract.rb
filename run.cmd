set file=%1%
@echo ------------------------------------------------------
@echo Extracting IP/Domain Patterns from %file%
@echo ------------------------------------------------------

for  /F "tokens=*" %%G IN ('type %file%') do ruby host-extract.rb -a -v %%G


 
sfdx force:org:create -f config/project-scratch-def.json -d 30 -s -w 60

# Install the package
sfdx force:package:install --package 04t1t000003HRGaAAO -w 30

sfdx force:source:push
sfdx force:user:permset:assign -n ExtId_Admin

sfdx force:org:open -p /Home

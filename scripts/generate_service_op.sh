#!/bin/bash

out_hh="../Shared/ServiceOperation.hh"
out_mm="../Shared/ServiceOperation.mm"
in_h="../../braincloud-cpp/Shared/ServiceOperation.h"
in_cpp="../../braincloud-cpp/Shared/ServiceOperation.cpp"

# build header
rm -rf "$out_hh"
echo "///////////////////////////////////////////////////////////////////" >> "$out_hh"
echo "// generated by $0, do not edit manually!" >> "$out_hh"
echo "///////////////////////////////////////////////////////////////////" >> "$out_hh"
echo "" >> "$out_hh"
echo "#import <Foundation/Foundation.h>" >> "$out_hh"
echo "" >> "$out_hh"
echo "#pragma once" >> "$out_hh"
echo "" >> "$out_hh"
sed -n -E "/.*static const ServiceOperation/{p;}" "$in_h" | sed -E "s/.*static const ServiceOperation (.*);/extern NSString const \*const BrainCloudServiceOperation\1;/g" >> "$out_hh"
echo "" >> "$out_hh"

# build source
rm -rf "$out_mm"
echo "///////////////////////////////////////////////////////////////////" >> "$out_mm"
echo "// generated by $0, do not edit manually!" >> "$out_mm"
echo "///////////////////////////////////////////////////////////////////" >> "$out_mm"
echo "" >> "$out_mm"
echo "#import \"ServiceOperation.hh\"" >> "$out_mm"
echo "#import \"ServiceOperation.h\"" >> "$out_mm"
echo "" >> "$out_mm"
sed -n -E "/.*static const ServiceOperation/{p;}" "$in_h" | sed -E "s/.*static const ServiceOperation (.*);/NSString const \*const BrainCloudServiceOperation\1 = \[NSString stringWithCString:BrainCloud::ServiceOperation::\1\.getValue\(\)\.c_str\(\) encoding:NSASCIIStringEncoding\];/g" >> "$out_mm"
echo "" >> "$out_mm"


// Copyright 2025 bitHeads, Inc. All Rights Reserved.

//
//  TypeHelpers.hh
//  brainCloudClientObjc
//
//  Created by Hill, Bradley on 2015-12-07.

//

#ifndef TypeHelpers_hh
#define TypeHelpers_hh

class TypeHelpers
{
public:
    static std::vector<std::string> NSStringArrayToVector(NSArray* array);

    static std::string NSStringToStdString(NSString* string);
};


#endif /* TypeHelpers_hh */

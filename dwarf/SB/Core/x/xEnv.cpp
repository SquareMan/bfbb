typedef struct RpLight;
typedef struct RxHeap;
typedef struct RwBBox;
typedef struct RwRGBA;
typedef struct RxPipelineNode;
typedef struct xLightKitLight;
typedef struct RwFrame;
typedef struct xEnv;
typedef struct RwTexCoords;
typedef struct RwV3d;
typedef struct RxPipelineNodeTopSortData;
typedef struct rxHeapBlockHeader;
typedef struct RxPipelineRequiresCluster;
typedef struct RpPolygon;
typedef struct RpMaterialList;
typedef struct RxPipeline;
typedef struct xJSPNodeInfo;
typedef struct RpMaterial;
typedef struct xClumpCollBSPBranchNode;
typedef struct RwSurfaceProperties;
typedef struct RwMatrixTag;
typedef struct rxHeapSuperBlockDescriptor;
typedef struct RpClump;
typedef struct rxReq;
typedef struct RwRaster;
typedef struct RpWorldSector;
typedef enum RxClusterValidityReq;
typedef struct xJSPHeader;
typedef enum RxNodeDefEditable;
typedef struct RpVertexNormal;
typedef enum RxClusterValid;
typedef struct rxHeapFreeBlock;
typedef struct RpMeshHeader;
typedef struct xClumpCollBSPTree;
typedef struct RwResEntry;
typedef enum rxEmbeddedPacketState;
typedef enum RxClusterForcePresent;
typedef struct RxClusterDefinition;
typedef struct RwTexDictionary;
typedef struct RxOutputSpec;
typedef struct iEnv;
typedef struct RxClusterRef;
typedef struct xLightKit;
typedef struct RwObject;
typedef struct RwLLLink;
typedef enum RpWorldRenderOrder;
typedef struct RxIoSpec;
typedef struct RwTexture;
typedef struct RpSector;
typedef struct RxNodeMethods;
typedef struct RxPipelineCluster;
typedef struct RxNodeDefinition;
typedef struct RxCluster;
typedef struct RxPipelineNodeParam;
typedef struct RpWorld;
typedef struct xClumpCollBSPVertInfo;
typedef struct RxPacket;
typedef struct xClumpCollBSPTriangle;
typedef struct RwRGBAReal;
typedef struct RwObjectHasFrame;
typedef struct RwLinkList;
typedef struct _class;

typedef uint32(*type_2)(RxPipelineNode*, uint32, uint32, void*);
typedef int32(*type_3)(RxPipelineNode*, RxPipelineNodeParam*);
typedef int32(*type_4)(RxNodeDefinition*);
typedef void(*type_5)(RxNodeDefinition*);
typedef int32(*type_7)(RxPipelineNode*);
typedef void(*type_8)(RxPipelineNode*);
typedef int32(*type_9)(RxPipelineNode*, RxPipeline*);
typedef RpClump*(*type_10)(RpClump*, void*);
typedef RpWorldSector*(*type_17)(RpWorldSector*);
typedef void(*type_19)(RwResEntry*);
typedef RwObjectHasFrame*(*type_22)(RwObjectHasFrame*);

typedef RpLight* type_0[2];
typedef RwFrame* type_1[2];
typedef uint16 type_6[3];
typedef int8 type_11[4];
typedef RwTexCoords* type_12[8];
typedef uint32 type_13[4];
typedef int8 type_14[16];
typedef int8 type_15[16];
typedef int8 type_16[32];
typedef int8 type_18[32];
typedef float32 type_20[16];
typedef RxCluster type_21[1];

struct RpLight
{
	RwObjectHasFrame object;
	float32 radius;
	RwRGBAReal color;
	float32 minusCosAngle;
	RwLinkList WorldSectorsInLight;
	RwLLLink inWorld;
	uint16 lightFrame;
	uint16 pad;
};

struct RxHeap
{
	uint32 superBlockSize;
	rxHeapSuperBlockDescriptor* head;
	rxHeapBlockHeader* headBlock;
	rxHeapFreeBlock* freeBlocks;
	uint32 entriesAlloced;
	uint32 entriesUsed;
	int32 dirty;
};

struct RwBBox
{
	RwV3d sup;
	RwV3d inf;
};

struct RwRGBA
{
	uint8 red;
	uint8 green;
	uint8 blue;
	uint8 alpha;
};

struct RxPipelineNode
{
	RxNodeDefinition* nodeDef;
	uint32 numOutputs;
	uint32* outputs;
	RxPipelineCluster** slotClusterRefs;
	uint32* slotsContinue;
	void* privateData;
	uint32* inputToClusterSlot;
	RxPipelineNodeTopSortData* topSortData;
	void* initializationData;
	uint32 initializationDataSize;
};

struct xLightKitLight
{
	uint32 type;
	RwRGBAReal color;
	float32 matrix[16];
	float32 radius;
	float32 angle;
	RpLight* platLight;
};

struct RwFrame
{
	RwObject object;
	RwLLLink inDirtyListLink;
	RwMatrixTag modelling;
	RwMatrixTag ltm;
	RwLinkList objectList;
	RwFrame* child;
	RwFrame* next;
	RwFrame* root;
};

struct xEnv
{
	iEnv* geom;
	iEnv ienv;
	xLightKit* lightKit;
};

struct RwTexCoords
{
	float32 u;
	float32 v;
};

struct RwV3d
{
	float32 x;
	float32 y;
	float32 z;
};

struct RxPipelineNodeTopSortData
{
	uint32 numIns;
	uint32 numInsVisited;
	rxReq* req;
};

struct rxHeapBlockHeader
{
	rxHeapBlockHeader* prev;
	rxHeapBlockHeader* next;
	uint32 size;
	rxHeapFreeBlock* freeEntry;
	uint32 pad[4];
};

struct RxPipelineRequiresCluster
{
	RxClusterDefinition* clusterDef;
	RxClusterValidityReq rqdOrOpt;
	uint32 slotIndex;
};

struct RpPolygon
{
	uint16 matIndex;
	uint16 vertIndex[3];
};

struct RpMaterialList
{
	RpMaterial** materials;
	int32 numMaterials;
	int32 space;
};

struct RxPipeline
{
	int32 locked;
	uint32 numNodes;
	RxPipelineNode* nodes;
	uint32 packetNumClusterSlots;
	rxEmbeddedPacketState embeddedPacketState;
	RxPacket* embeddedPacket;
	uint32 numInputRequirements;
	RxPipelineRequiresCluster* inputRequirements;
	void* superBlock;
	uint32 superBlockSize;
	uint32 entryPoint;
	uint32 pluginId;
	uint32 pluginData;
};

struct xJSPNodeInfo
{
	int32 originalMatIndex;
	int32 nodeFlags;
};

struct RpMaterial
{
	RwTexture* texture;
	RwRGBA color;
	RxPipeline* pipeline;
	RwSurfaceProperties surfaceProps;
	int16 refCount;
	int16 pad;
};

struct xClumpCollBSPBranchNode
{
	uint32 leftInfo;
	uint32 rightInfo;
	float32 leftValue;
	float32 rightValue;
};

struct RwSurfaceProperties
{
	float32 ambient;
	float32 specular;
	float32 diffuse;
};

struct RwMatrixTag
{
	RwV3d right;
	uint32 flags;
	RwV3d up;
	uint32 pad1;
	RwV3d at;
	uint32 pad2;
	RwV3d pos;
	uint32 pad3;
};

struct rxHeapSuperBlockDescriptor
{
	void* start;
	uint32 size;
	rxHeapSuperBlockDescriptor* next;
};

struct RpClump
{
	RwObject object;
	RwLinkList atomicList;
	RwLinkList lightList;
	RwLinkList cameraList;
	RwLLLink inWorldLink;
	RpClump*(*callback)(RpClump*, void*);
};

struct rxReq
{
};

struct RwRaster
{
	RwRaster* parent;
	uint8* cpPixels;
	uint8* palette;
	int32 width;
	int32 height;
	int32 depth;
	int32 stride;
	int16 nOffsetX;
	int16 nOffsetY;
	uint8 cType;
	uint8 cFlags;
	uint8 privateFlags;
	uint8 cFormat;
	uint8* originalPixels;
	int32 originalWidth;
	int32 originalHeight;
	int32 originalStride;
};

struct RpWorldSector
{
	int32 type;
	RpPolygon* polygons;
	RwV3d* vertices;
	RpVertexNormal* normals;
	RwTexCoords* texCoords[8];
	RwRGBA* preLitLum;
	RwResEntry* repEntry;
	RwLinkList collAtomicsInWorldSector;
	RwLinkList noCollAtomicsInWorldSector;
	RwLinkList lightsInWorldSector;
	RwBBox boundingBox;
	RwBBox tightBoundingBox;
	RpMeshHeader* mesh;
	RxPipeline* pipeline;
	uint16 matListWindowBase;
	uint16 numVertices;
	uint16 numPolygons;
	uint16 pad;
};

enum RxClusterValidityReq
{
	rxCLREQ_DONTWANT,
	rxCLREQ_REQUIRED,
	rxCLREQ_OPTIONAL,
	rxCLUSTERVALIDITYREQFORCEENUMSIZEINT = 0x7fffffff
};

struct xJSPHeader
{
	int8 idtag[4];
	uint32 version;
	uint32 jspNodeCount;
	RpClump* clump;
	xClumpCollBSPTree* colltree;
	xJSPNodeInfo* jspNodeList;
};

enum RxNodeDefEditable
{
	rxNODEDEFCONST,
	rxNODEDEFEDITABLE,
	rxNODEDEFEDITABLEFORCEENUMSIZEINT = 0x7fffffff
};

struct RpVertexNormal
{
	int8 x;
	int8 y;
	int8 z;
	uint8 pad;
};

enum RxClusterValid
{
	rxCLVALID_NOCHANGE,
	rxCLVALID_VALID,
	rxCLVALID_INVALID,
	rxCLUSTERVALIDFORCEENUMSIZEINT = 0x7fffffff
};

struct rxHeapFreeBlock
{
	uint32 size;
	rxHeapBlockHeader* ptr;
};

struct RpMeshHeader
{
	uint32 flags;
	uint16 numMeshes;
	uint16 serialNum;
	uint32 totalIndicesInMesh;
	uint32 firstMeshOffset;
};

struct xClumpCollBSPTree
{
	uint32 numBranchNodes;
	xClumpCollBSPBranchNode* branchNodes;
	uint32 numTriangles;
	xClumpCollBSPTriangle* triangles;
};

struct RwResEntry
{
	RwLLLink link;
	int32 size;
	void* owner;
	RwResEntry** ownerRef;
	void(*destroyNotify)(RwResEntry*);
};

enum rxEmbeddedPacketState
{
	rxPKST_PACKETLESS,
	rxPKST_UNUSED,
	rxPKST_INUSE,
	rxPKST_PENDING,
	rxEMBEDDEDPACKETSTATEFORCEENUMSIZEINT = 0x7fffffff
};

enum RxClusterForcePresent
{
	rxCLALLOWABSENT,
	rxCLFORCEPRESENT,
	rxCLUSTERFORCEPRESENTFORCEENUMSIZEINT = 0x7fffffff
};

struct RxClusterDefinition
{
	int8* name;
	uint32 defaultStride;
	uint32 defaultAttributes;
	int8* attributeSet;
};

struct RwTexDictionary
{
	RwObject object;
	RwLinkList texturesInDict;
	RwLLLink lInInstance;
};

struct RxOutputSpec
{
	int8* name;
	RxClusterValid* outputClusters;
	RxClusterValid allOtherClusters;
};

struct iEnv
{
	RpWorld* world;
	RpWorld* collision;
	RpWorld* fx;
	RpWorld* camera;
	xJSPHeader* jsp;
	RpLight* light[2];
	RwFrame* light_frame[2];
	int32 memlvl;
};

struct RxClusterRef
{
	RxClusterDefinition* clusterDef;
	RxClusterForcePresent forcePresent;
	uint32 reserved;
};

struct xLightKit
{
	uint32 tagID;
	uint32 groupID;
	uint32 lightCount;
	xLightKitLight* lightList;
};

struct RwObject
{
	uint8 type;
	uint8 subType;
	uint8 flags;
	uint8 privateFlags;
	void* parent;
};

struct RwLLLink
{
	RwLLLink* next;
	RwLLLink* prev;
};

enum RpWorldRenderOrder
{
	rpWORLDRENDERNARENDERORDER,
	rpWORLDRENDERFRONT2BACK,
	rpWORLDRENDERBACK2FRONT,
	rpWORLDRENDERORDERFORCEENUMSIZEINT = 0x7fffffff
};

struct RxIoSpec
{
	uint32 numClustersOfInterest;
	RxClusterRef* clustersOfInterest;
	RxClusterValidityReq* inputRequirements;
	uint32 numOutputs;
	RxOutputSpec* outputs;
};

struct RwTexture
{
	RwRaster* raster;
	RwTexDictionary* dict;
	RwLLLink lInDictionary;
	int8 name[32];
	int8 mask[32];
	uint32 filterAddressing;
	int32 refCount;
};

struct RpSector
{
	int32 type;
};

struct RxNodeMethods
{
	int32(*nodeBody)(RxPipelineNode*, RxPipelineNodeParam*);
	int32(*nodeInit)(RxNodeDefinition*);
	void(*nodeTerm)(RxNodeDefinition*);
	int32(*pipelineNodeInit)(RxPipelineNode*);
	void(*pipelineNodeTerm)(RxPipelineNode*);
	int32(*pipelineNodeConfig)(RxPipelineNode*, RxPipeline*);
	uint32(*configMsgHandler)(RxPipelineNode*, uint32, uint32, void*);
};

struct RxPipelineCluster
{
	RxClusterDefinition* clusterRef;
	uint32 creationAttributes;
};

struct RxNodeDefinition
{
	int8* name;
	RxNodeMethods nodeMethods;
	RxIoSpec io;
	uint32 pipelineNodePrivateDataSize;
	RxNodeDefEditable editable;
	int32 InputPipesCnt;
};

struct RxCluster
{
	uint16 flags;
	uint16 stride;
	void* data;
	void* currentData;
	uint32 numAlloced;
	uint32 numUsed;
	RxPipelineCluster* clusterRef;
	uint32 attributes;
};

struct RxPipelineNodeParam
{
	void* dataParam;
	RxHeap* heap;
};

struct RpWorld
{
	RwObject object;
	uint32 flags;
	RpWorldRenderOrder renderOrder;
	RpMaterialList matList;
	RpSector* rootSector;
	int32 numTexCoordSets;
	int32 numClumpsInWorld;
	RwLLLink* currentClumpLink;
	RwLinkList clumpList;
	RwLinkList lightList;
	RwLinkList directionalLightList;
	RwV3d worldOrigin;
	RwBBox boundingBox;
	RpWorldSector*(*renderCallBack)(RpWorldSector*);
	RxPipeline* pipeline;
};

struct xClumpCollBSPVertInfo
{
	uint16 atomIndex;
	uint16 meshVertIndex;
};

struct RxPacket
{
	uint16 flags;
	uint16 numClusters;
	RxPipeline* pipeline;
	uint32* inputToClusterSlot;
	uint32* slotsContinue;
	RxPipelineCluster** slotClusterRefs;
	RxCluster clusters[1];
};

struct xClumpCollBSPTriangle
{
	_class v;
	uint8 flags;
	uint8 platData;
	uint16 matIndex;
};

struct RwRGBAReal
{
	float32 red;
	float32 green;
	float32 blue;
	float32 alpha;
};

struct RwObjectHasFrame
{
	RwObject object;
	RwLLLink lFrame;
	RwObjectHasFrame*(*sync)(RwObjectHasFrame*);
};

struct RwLinkList
{
	RwLLLink link;
};

struct _class
{
	union
	{
		xClumpCollBSPVertInfo i;
		RwV3d* p;
	};
};

xEnv* gCurXEnv;
int8 buffer[16];
int8 buffer[16];

void xEnvRender(xEnv* env);
void xEnvFree(xEnv* env);
void xEnvSetup(xEnv* env);
void xEnvLoadBsp(xEnv* env, void* data, uint32 datasize, int32 dataType);

// xEnvRender__FP4xEnv
// Start address: 0x1da7e0
void xEnvRender(xEnv* env)
{
	// Line 130, Address: 0x1da7e0, Func Offset: 0
	// Line 135, Address: 0x1da7ec, Func Offset: 0xc
	// Line 136, Address: 0x1da7f4, Func Offset: 0x14
	// Line 137, Address: 0x1da800, Func Offset: 0x20
	// Func End, Address: 0x1da80c, Func Offset: 0x2c
}

// xEnvFree__FP4xEnv
// Start address: 0x1da810
void xEnvFree(xEnv* env)
{
	// Line 110, Address: 0x1da810, Func Offset: 0
	// Line 114, Address: 0x1da824, Func Offset: 0x14
	// Line 117, Address: 0x1da82c, Func Offset: 0x1c
	// Line 119, Address: 0x1da834, Func Offset: 0x24
	// Line 123, Address: 0x1da838, Func Offset: 0x28
	// Func End, Address: 0x1da848, Func Offset: 0x38
}

// xEnvSetup__FP4xEnv
// Start address: 0x1da850
void xEnvSetup(xEnv* env)
{
	// Line 81, Address: 0x1da850, Func Offset: 0
	// Line 84, Address: 0x1da860, Func Offset: 0x10
	// Line 87, Address: 0x1da868, Func Offset: 0x18
	// Line 89, Address: 0x1da86c, Func Offset: 0x1c
	// Line 90, Address: 0x1da870, Func Offset: 0x20
	// Func End, Address: 0x1da880, Func Offset: 0x30
}

// xEnvLoadBsp__FP4xEnvPCvUii
// Start address: 0x1da880
void xEnvLoadBsp(xEnv* env, void* data, uint32 datasize, int32 dataType)
{
	// Line 43, Address: 0x1da880, Func Offset: 0
	// Line 46, Address: 0x1da88c, Func Offset: 0xc
	// Line 49, Address: 0x1da894, Func Offset: 0x14
	// Line 50, Address: 0x1da89c, Func Offset: 0x1c
	// Line 52, Address: 0x1da8a0, Func Offset: 0x20
	// Line 56, Address: 0x1da8a8, Func Offset: 0x28
	// Line 57, Address: 0x1da8ac, Func Offset: 0x2c
	// Func End, Address: 0x1da8bc, Func Offset: 0x3c
}


#ifndef $MACRO_H
#define $MACRO_H

#ifdef __cplusplus
extern "C" {
#endif

/////////////////////////////////// Includes ///////////////////////////////////

///////////////////////////////////  Macros  ///////////////////////////////////

////////////////////////////////////  Type  ////////////////////////////////////

//////////////////////////////////  Constants //////////////////////////////////

//////////////////////////////////  Functions //////////////////////////////////

void ConfigSPIxTxDMAChannel(DMA_TypeDef *GPDMAx, SPI_TypeDef *SPIx, \
  uint8_t *buff, uint32_t size) {
  ;
}

void ConfigSPIxRxDMAChannel(DMA_TypeDef *GPDMAx, SPI_TypeDef *SPIx, \
  uint8_t *buff, uint32_t size) {
  ;
}

void ConfigI2CxTxDMAChannel(DMA_TypeDef *GPDMAx, SPI_TypeDef *SPIx, \
  uint8_t *buff, uint32_t size) {
  ;
}

void ConfigI2CxRxDMAChannel(DMA_TypeDef *GPDMAx, SPI_TypeDef *SPIx, \
  uint8_t *buff, uint32_t size) {
  ;
}

//////////////////////////////////  Variables //////////////////////////////////

volatile uint8_t spiTxBuff[CDC_DATA_HS_MAX_PACKET_SIZE];
volatile uint8_t spiRxBuff[CDC_DATA_HS_MAX_PACKET_SIZE];

volatile uint8_t i2cTxBuff[CDC_DATA_HS_MAX_PACKET_SIZE];
volatile uint8_t i2cRxBuff[CDC_DATA_HS_MAX_PACKET_SIZE];

volatile uint8_t mdioTxBuff[CDC_DATA_HS_MAX_PACKET_SIZE];
volatile uint8_t mdioRxBuff[CDC_DATA_HS_MAX_PACKET_SIZE];

#ifdef __cplusplus
}
#endif

#endif
// end of $COMPONENT_NAME 

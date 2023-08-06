const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true
})

// module.exports = {
//   // 기존의 설정...
//   chainWebpack: config => {
//     config.module
//       .rule('css')
//       .test(/\.css$/)
//       .use('css-loader')
//       .loader('css-loader')
//       .end()
//   },
//   // 기존의 설정...
// };
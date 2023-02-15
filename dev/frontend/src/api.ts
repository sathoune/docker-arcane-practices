import axios from "axios"

const writeAddress = `${import.meta.env.VITE_WRITE_HOST}/write`
const readAddress = `${import.meta.env.VITE_READ_HOST}/read`


export const writeCall = async (data: string) => {
  const res = await axios.get(writeAddress, {
    params: {
      message: data
    }
  })
  return res.data
}
export const readCall = async () => {
  const res = await axios.get(readAddress)
  return res.data
}

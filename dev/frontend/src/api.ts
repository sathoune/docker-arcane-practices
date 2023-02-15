import axios from "axios"

export const writeCall = async (data: string) => {
  const res = await axios.get("http://localhost:8008/write", {
    params: {
      message: data
    }
  })
  return res.data
}
export const readCall = async () => {
  const res = await axios.get("http://localhost:8000/read")
  return res.data as (string | null)
}
